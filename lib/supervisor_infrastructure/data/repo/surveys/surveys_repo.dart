import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/surveys/employee_survey_reponse_model.dart';
import '../../models/surveys/submit_reponse_model.dart';
import '../../models/surveys/submit_survey_request_body.dart';
import '../../models/surveys/surveys_reponse_model.dart';

abstract class SurveysRepo {
  Future<Either<Failure, SurveyResponseModel>> getSurveys();
  Future<Either<Failure, SurveySubmitResponseModel>> submitSurvey(
      {required SubmitSurveyRequestBody requestBody});

  Future<Either<Failure, EmployeeSurveyReponseModel>> getSurveyByEmployeeId();
}
