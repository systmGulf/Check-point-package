import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../hr_manamgement_system_package.dart';
import '../models/register_account_request_body.dart';
import 'register_account_repo.dart'; // Adjust the import path

class RegisterAccountRepoImpl implements RegisterAccountRepo {
  final ApiService apiService;

  RegisterAccountRepoImpl({required this.apiService});

  @override
  // Admin add new user
  Future<Either<Failure, void>> registerAccount(
      {required String name, required String deviceToken}) async {
    try {
      String? deviceId = await getId();
      if (deviceId != null) {
        final result = await apiService.post(
            endPoint: ApiConstant.accountRequest,
            body: RegisterAccountRequestBody(
              name: name,
              mobileId: deviceId,
              deviceToken: deviceToken,
            ).toJson());
        if (result[ApiConstant.successApiKey] == true) {
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
  }
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
  return null;
}
