import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/errors/internet_checker.dart';
import '../../hr_manamgement_system_package.dart';
import '../models/register_account_request_body.dart';
import 'register_account_repo.dart';

class RegisterAccountRepoImpl implements RegisterAccountRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  RegisterAccountRepoImpl(this.networkInfo, {required this.apiService});
  @override

  // admin add new user
  Future<Either<Failure, void>> registerAccount(
      {required String name,required String deviceToken}) async {
    if (await networkInfo.isConnected) {
      try {
        String? deviceId = await getId();
        if (deviceToken != null && deviceId != null) {
          final result = await apiService.post(
              endPoint: ApiConstant.accountRequest,
              body: RegisterAccountRequestBody(
                name: name,
                mobileId: deviceId,
                deviceToken: deviceToken,
              ).toJson());
          if (result['isSuccess'] == true) {
            return const Right(null);
          } else {
            return Left(Failure(404, getResponseError(result)));
          }
        } else {
          return Left(Failure(404, "Device token not found "));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
  return null;
}
