import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/core/networking/api_service.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_assesment_model/assesment_input_model/assesment_input_model.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_assesment_model/assesment_model.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/repo/assesment_repo/assesment_repo.dart';

import '../../../../core/networking/api_constant.dart';

class AssesmentRepoImpl implements AssesmentRepo {
  final ApiService apiService;

  AssesmentRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<EmployeeAssessmentModel>>> getAssesments() async {
    try {
      final result = await apiService.get(
          endPoint: ApiConstant.assesmentS(ApiConstant.employeeId.trim()));
      if (result[ApiConstant.successApiKey] == true) {
        final assesments = (result['value'] as List)
            .map((e) =>
                EmployeeAssessmentModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(assesments);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, EmployeeAssessmentModel>> getAssesmentsById(
      String employeeId, String assesmentId) async {
    try {
      final result = await apiService.get(
        endPoint: ApiConstant.getAssesment(
            ApiConstant.employeeId.trim(), assesmentId),
      );
      if (result[ApiConstant.successApiKey] == true) {
        final assesment = EmployeeAssessmentModel.fromJson(
            result['value'] as Map<String, dynamic>);
        return Right(assesment);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, EmployeeAssessmentModel>> submit(
      AssesmentInputModel input) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.submitAssesment,
        body: input.toJson(),
      );
      if (result[ApiConstant.successApiKey] == true) {
        final assesment = EmployeeAssessmentModel.fromJson(
            result['value'] as Map<String, dynamic>);
        return Right(assesment);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
