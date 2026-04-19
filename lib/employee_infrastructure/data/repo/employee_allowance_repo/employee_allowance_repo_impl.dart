import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/core/networking/api_constant.dart';
import 'package:hr_management_system_package/core/networking/api_service.dart';

import '../../models/employee_allowance_model/beneficiary_allowances_response.dart';
import '../../models/employee_allowance_model/request_allowance_request_body.dart';
import 'employee_allowance_repo.dart';

class EmployeeAllowanceRepoImpl implements EmployeeAllowanceRepo {
  EmployeeAllowanceRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, BeneficiaryAllowancesResponse>>
      getBeneficiaryAllowances({String? employeeId}) async {
    try {
      final targetEmployeeId = employeeId?.trim();
      final endPoint = (targetEmployeeId == null || targetEmployeeId.isEmpty)
          ? ApiConstant.beneficiaryAllowance
          : '${ApiConstant.beneficiaryAllowance}?employeeId=${Uri.encodeQueryComponent(targetEmployeeId)}';

      final result = await apiService.get(endPoint: endPoint);

      if (result[ApiConstant.successApiKey] == true) {
        return Right(BeneficiaryAllowancesResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, AllowanceRequestResponse>> requestAllowance(
    RequestAllowanceRequestBody requestBody,
  ) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.requestAllowance,
        body: requestBody.toJson(),
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(AllowanceRequestResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
