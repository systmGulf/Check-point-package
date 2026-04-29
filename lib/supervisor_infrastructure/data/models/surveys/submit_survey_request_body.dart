import 'package:json_annotation/json_annotation.dart';

part 'submit_survey_request_body.g.dart';

@JsonSerializable()
class SubmitSurveyRequestBody {
  final String surveyId;
  final String employeeId;
  final List<SurveyAnswerRequestModel> answers;

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
  final String questionText;

  SurveyAnswerRequestModel({
    required this.questionId,
    required this.answerText,
    required this.questionText,
  });

  factory SurveyAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyAnswerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyAnswerRequestModelToJson(this);
}
