import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';

import '../../models/employee_assets_model/employee_asset_requests_response.dart';
import '../../models/employee_assets_model/employee_assets_response.dart';
import '../../models/employee_assets_model/request_asset_request_body.dart';

abstract class EmployeeAssetsRepo {
  Future<Either<Failure, EmployeeAssetsResponse>> getAllAssets();
  Future<Either<Failure, EmployeeAssetRequestsResponse>> getAssetsForEmployee(
      {String? employeeId});
  Future<Either<Failure, EmployeeAssetRequestResponse>> requestAsset(
      RequestAssetRequestBody requestBody);
}
