import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_beneficiary_benefits_response.dart';
import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_profile_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/update_employee_profile_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/user_skills_response.dart';

import '../../../../hr_manamgement_system_package.dart';
import 'employee_summary_repo.dart';

class EmployeeSummaryRepoImpl implements EmployeeSummaryRepo {
  final ApiService apiService;

  EmployeeSummaryRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, EmployeeProfileValue>> getEmployeeProfile({
    required String employeeId,
  }) async {
    try {
      final result = await apiService.get(
        endPoint: "${ApiConstant.apiEmployee}/$employeeId",
      );
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeProfileValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserSkillItem>>> getUserSkills({
    required String employeeId,
  }) async {
    try {
      final result = await apiService.get(
        endPoint: "${ApiConstant.employeeSkill}/Employee/$employeeId",
      );
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'] as List<dynamic>? ?? [];
        return Right(value.map((e) => UserSkillItem.fromJson(e)).toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<EmployeeBeneficiaryBenefitItem>>>
      getBeneficiaryBenefits({
    required String employeeId,
  }) async {
    try {
      final encodedEmployeeId = Uri.encodeQueryComponent(employeeId);
      final result = await apiService.get(
        endPoint:
            "${ApiConstant.employeeBeneficiaryBenefit}/getBeneficiaryBenefitsData?employeeId=$encodedEmployeeId",
      );

      if (result[ApiConstant.successApiKey] == true) {
        final response = EmployeeBeneficiaryBenefitsResponse.fromJson(result);
        return Right(response.value);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateEmployeeProfile({
    required String employeeId,
    required UpdateEmployeeProfileRequestBody body,
  }) async {
    try {
      final result = await apiService.put(
        endPoint: "${ApiConstant.apiEmployee}/$employeeId",
        body: body.toJson(),
      );

      if (result is Map<String, dynamic>) {
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        }
        return Left(Failure(404, getResponseError(result)));
      }

      // Some backends return empty/non-standard body on successful PUT.
      return const Right(null);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
