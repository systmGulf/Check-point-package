import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/core/networking/api_constant.dart';
import 'package:hr_management_system_package/core/networking/api_service.dart';

import '../../models/employee_benefit_model/create_employee_benefit_request_body.dart';
import '../../models/employee_benefit_model/create_employee_benefit_response.dart';
import '../../models/employee_benefit_model/employee_benefits_response.dart';
import 'employee_benefit_repo.dart';

class EmployeeBenefitRepoImpl implements EmployeeBenefitRepo {
  EmployeeBenefitRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, EmployeeBenefitsResponse>> getAllBenefits() async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.getAllBenefits);

      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeBenefitsResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, CreateEmployeeBenefitResponse>>
      createEmployeeBenefitRequest(
    CreateEmployeeBenefitRequestBody requestBody,
  ) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.createEmployeeBenefitRequest,
        body: requestBody.toJson(),
      );

      if (result[ApiConstant.successApiKey] == true) {
        return Right(CreateEmployeeBenefitResponse.fromJson(result));
      }

      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
