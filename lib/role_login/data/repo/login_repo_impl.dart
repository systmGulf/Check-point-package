import 'package:dartz/dartz.dart';

import '../../../core/errors/internet_checker.dart';
import '../../../hr_manamgement_system_package.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiservice;
  final NetworkInfo networkInfo;
  LoginRepoImpl(this.networkInfo, {required this.apiservice});
  @override
  Future<Either<Failure, RoleLoginModel>> roleLogin(
      RoleLoginRequestBody roleLoginRequestBody) async {
    // THIS VARIABLE IS USED TO STORE THE ID OF THE DEVICE THAT IS LOGGED IN <<<<<<<<<<<<<
    // String mobileIds = await getId() ?? '';

    if (await networkInfo.isConnected) {
      try {
        final response = await apiservice.post(
          endPoint: ApiConstant.login,
          body: roleLoginRequestBody.toJson(),
        );

        if (response['isSuccess'] == true) {
          List<dynamic> roles = response['value']['roles'] ?? [];
          if (roles.contains(roleLoginRequestBody.role)) {
            await SecureCache.insertToCache(
              key: 'token',
              value: response['value']['token'],
            );
            await SecureCache.insertToCache(
              key: 'username',
              value: response['value']['userName'],
            );
            await SecureCache.insertToCache(
              key: 'employeeId',
              value: response['value']['id'],
            );

            ApiConstant.token = await SecureCache.getFromCache(key: 'token');
            ApiConstant.username =
                await SecureCache.getFromCache(key: 'username');
            ApiConstant.employeeId =
                await SecureCache.getFromCache(key: 'employeeId');
            return Right(RoleLoginModel.fromJson(response));
          } else {
            return Left(Failure(
                404, "Make sure you are an ${roleLoginRequestBody.role}"));
          }
        } else {
          return Left(Failure(404, getResponseError(response).toString()));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, EmployeeData>> getEmployeeById() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.employee}/${ApiConstant.employeeId}");

        if (result['isSuccess'] == true) {
          await SecureCache.insertToCache(
            key: 'departmentId',
            value: result['value']['departmentId'].toString(),
          );
          await SecureCache.insertToCache(
            key: 'position',
            value: result['value']['position'].toString(),
          );
          await SecureCache.insertToCache(
            key: 'employeeId',
            value: result['value']['id'].toString(),
          );

          ApiConstant.departmentId =
              await SecureCache.getFromCache(key: 'departmentId');
          ApiConstant.employeeId =
              await SecureCache.getFromCache(key: 'employeeId');
          ApiConstant.position =
              await SecureCache.getFromCache(key: 'position');

          await SecureCache.insertToCache(
            key: 'branchId',
            value: result['value']['branchId'].toString(),
          );
          ApiConstant.branchId =
              await SecureCache.getFromCache(key: 'branchId');
          if (ApiConstant.departmentId != '') {
            return Right(EmployeeData.fromJson(result['value']));
          } else {
            return Left(Failure(404, "No data found"));
          }
        } else {
          return Left(Failure(404, getResponseError(result).toString()));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
