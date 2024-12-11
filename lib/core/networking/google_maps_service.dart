import 'package:location/location.dart';

abstract class LocationService {
  static Location location = Location();
  static Future<bool> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      var isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return false;
      } else {
        return true;
      }
    }
    return true;
  }

  static Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return false;
      } else {
        return true;
      }
    }
    return true;
  }

  static void getRealTimeLocation(Function(LocationData)? onData) {
    location.onLocationChanged.listen(onData);
  }

  static getCurrentLocation() {
    return location.getLocation();
  }

  static Future<bool> getLocationData() async {
    var isServiceEnabled = await checkAndRequestLocationService();
    var hasPermission = await checkAndRequestLocationPermission();
    if (isServiceEnabled && hasPermission) {
      return true;
    } else {
      return false;
    }
  }
}
