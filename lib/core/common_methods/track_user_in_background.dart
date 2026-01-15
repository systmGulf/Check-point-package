import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_management_system_package/core/core.dart';
import 'package:hr_management_system_package/core/dependecy_injection/service_locator.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_attendance_model/track_user_request_body.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/repo/employee_attendance_repo/employee_attendance_repo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initializeServiceBackground() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      autoStartOnBoot: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

Future<bool> handleLocationPermissionAndGPS() async {
  if (!await _requestLocationPermission()) {
    return false;
  }

  if (!await _isGPSEnabled()) {
    return false;
  }

  return true;
}

Future<bool> _requestLocationPermission() async {
  var status = await Permission.locationWhenInUse.status;
  if (!status.isGranted) {
    status = await Permission.locationWhenInUse.request();
    if (!status.isGranted) {
      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  status = await Permission.locationAlways.status;
  if (!status.isGranted) {
    status = await Permission.locationAlways.request();
    if (!status.isGranted) {
      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  return true;
}

Future<bool> _isGPSEnabled() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  return serviceEnabled;
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.reload();
  final log = preferences.getStringList('log') ?? <String>[];
  log.add(DateTime.now().toIso8601String());
  await preferences.setStringList('log', log);
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  setUpServiceLocator();
  ApiConstant.employeeId = await SecureCache.getFromCache(key: 'employeeId');
  DartPluginRegistrant.ensureInitialized();

  bool running = true;

  service.on('get_status').listen((event) {
    service.invoke('service_status', {'running': running});
  });

  service.on('stop').listen((event) {
    running = false;
    service.invoke('service_status', {'running': running});
    service.stopSelf();
  });

  Timer.periodic(const Duration(seconds: 5), (timer) async {
    try {
      final position = await Geolocator.getCurrentPosition();
      log('${position.latitude} , ${position.longitude}');
      getIt<EmployeeAttendanceRepo>().trackEmployeeLocation(
        trackUserRequestBody: TrackUserRequestBody(
          employeeId: ApiConstant.employeeId,
          coordinates: [
            {"latitude": position.latitude, "longitude": position.longitude}
          ],
        ),
      );
    } catch (e) {
      log('Location error: $e');
    }
  });
}
