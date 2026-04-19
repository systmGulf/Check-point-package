import 'package:hr_management_system_package/supervisor_infrastructure/data/models/surveys/employee_survey_reponse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_survey_request_body.g.dart';

@JsonSerializable()
class SubmitSurveyRequestBody {
  final String surveyId;
  final String employeeId;
  final List<SurveyAnswerModel> answers;

  SubmitSurveyRequestBody({
    required this.surveyId,
    required this.employeeId,
    required this.answers,
  });

  factory SubmitSurveyRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SubmitSurveyRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSurveyRequestBodyToJson(this);
}

@JsonSerializable()
class SurveyAnswerRequestModel {
  final String questionId;
  final String answerText;

  SurveyAnswerRequestModel({
    required this.questionId,
    required this.answerText,
  });

  factory SurveyAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyAnswerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyAnswerRequestModelToJson(this);
}
