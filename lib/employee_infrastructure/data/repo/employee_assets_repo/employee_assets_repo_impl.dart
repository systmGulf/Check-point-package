import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/core/networking/api_constant.dart';
import 'package:hr_management_system_package/core/networking/api_service.dart';

import '../../models/employee_assets_model/employee_asset_requests_response.dart';
import '../../models/employee_assets_model/employee_assets_response.dart';
import '../../models/employee_assets_model/request_asset_request_body.dart';
import 'employee_assets_repo.dart';

class EmployeeAssetsRepoImpl implements EmployeeAssetsRepo {
  EmployeeAssetsRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, EmployeeAssetsResponse>> getAllAssets() async {
    try {
      final result = await apiService.get(
        endPoint: ApiConstant.getAllAssets,
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(
          EmployeeAssetsResponse.fromJson(result),
        );
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, EmployeeAssetRequestsResponse>> getAssetsForEmployee(
      {String? employeeId}) async {
    try {
      final targetEmployeeId = employeeId ?? ApiConstant.employeeId;
      final result = await apiService.get(
        endPoint: ApiConstant.getAssetsForEmployee(targetEmployeeId),
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(
          EmployeeAssetRequestsResponse.fromJson(result),
        );
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, EmployeeAssetRequestResponse>> requestAsset(
      RequestAssetRequestBody requestBody) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.requestAsset,
        body: requestBody.toJson(),
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(
          EmployeeAssetRequestResponse.fromJson(result),
        );
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
