import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/surveys/employee_survey_reponse_model.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/surveys/submit_reponse_model.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/surveys/submit_survey_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/surveys/surveys_reponse_model.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/repo/surveys/surveys_repo.dart';

import '../../../../core/core.dart';

class SurveysRepoImpl implements SurveysRepo {
  final ApiService apiService;

  SurveysRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, EmployeeSurveyReponseModel>>
      getSurveyByEmployeeId() async {
    try {
      final reponse = await apiService.get(
          endPoint: ApiConstant.getEmployeeSurveys(ApiConstant.employeeId));
      if (reponse[ApiConstant.successApiKey] == true) {
        return Right(EmployeeSurveyReponseModel.fromJson(reponse));
      }
      return Left(Failure(404, getResponseError(reponse)));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, SurveyResponseModel>> getSurveys() async {
    try {
      final reponse = await apiService.get(endPoint: ApiConstant.getAllSurveys);
      if (reponse[ApiConstant.successApiKey] == true) {
        return Right(SurveyResponseModel.fromJson(reponse));
      }
      return Left(Failure(404, getResponseError(reponse)));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, SurveySubmitResponseModel>> submitSurvey(
      {required SubmitSurveyRequestBody requestBody}) async {
    try {
      final reponse = await apiService.post(
          endPoint: ApiConstant.submitSurvey, body: requestBody.toJson());
      if (reponse[ApiConstant.successApiKey] == true) {
        return Right(SurveySubmitResponseModel.fromJson(reponse));
      }
      return Left(Failure(404, getResponseError(reponse)));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
