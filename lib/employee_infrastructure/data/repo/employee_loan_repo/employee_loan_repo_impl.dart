import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/core/networking/api_constant.dart';
import 'package:hr_management_system_package/core/networking/api_service.dart';

import '../../models/employee_loan_model/create_loan_request_body.dart';
import '../../models/employee_loan_model/create_loan_request_response.dart';
import '../../models/employee_loan_model/employee_loans_response.dart';
import '../../models/employee_loan_model/installement_types_response.dart';
import 'employee_loan_repo.dart';

class EmployeeLoanRepoImpl implements EmployeeLoanRepo {
  EmployeeLoanRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, EmployeeLoansResponse>> getAllLoans(
      {String? targetEmployeeId}) async {
    try {
      final result = await apiService.get(
          endPoint: (targetEmployeeId == null || targetEmployeeId.isEmpty)
              ? ApiConstant.getAllLoans
              : '${ApiConstant.getAllLoans}?RequesterId=${Uri.encodeQueryComponent(targetEmployeeId)}');
      ;
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeLoansResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, InstallementTypesResponse>>
      getInstallementTypes() async {
    try {
      final result =
          await apiService.get(endPoint: ApiConstant.getAllInstallementTypes);

      if (result[ApiConstant.successApiKey] == true) {
        return Right(InstallementTypesResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, CreateLoanRequestResponse>> createLoanRequest(
      CreateLoanRequestBody requestBody) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.createLoanRequest,
        body: requestBody.toJson(),
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(CreateLoanRequestResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
