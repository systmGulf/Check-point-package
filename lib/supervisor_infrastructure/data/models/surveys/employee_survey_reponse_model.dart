import 'package:json_annotation/json_annotation.dart';

part 'employee_survey_reponse_model.g.dart';

@JsonSerializable()
class EmployeeSurveyReponseModel {
  final List<SurveySubmissionModel> value;
  final int status;
  final bool isSuccess;
  final String successMessage;
  final String correlationId;
  final List<String> errors;
  final List<ValidationErrorModel> validationErrors;

  EmployeeSurveyReponseModel({
    required this.value,
    required this.status,
    required this.isSuccess,
    required this.successMessage,
    required this.correlationId,
    required this.errors,
    required this.validationErrors,
  });

  factory EmployeeSurveyReponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSurveyReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeSurveyReponseModelToJson(this);
}

@JsonSerializable()
class SurveySubmissionModel {
  final String id;
  final String surveyId;
  final String surveyTitle;
  final String employeeId;
  final DateTime submittedAt;
  final List<SurveyAnswerModel> answers;

  SurveySubmissionModel({
    required this.id,
    required this.surveyId,
    required this.surveyTitle,
    required this.employeeId,
    required this.submittedAt,
    required this.answers,
  });

  factory SurveySubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$SurveySubmissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveySubmissionModelToJson(this);
}

@JsonSerializable()
class SurveyAnswerModel {
  final String questionId;
  final String answerText;

  SurveyAnswerModel({
    required this.questionId,
    required this.answerText,
  });

  factory SurveyAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyAnswerModelToJson(this);
}

@JsonSerializable()
class ValidationErrorModel {
  final String identifier;
  final String errorMessage;
  final String errorCode;
  final int severity;

  ValidationErrorModel({
    required this.identifier,
    required this.errorMessage,
    required this.errorCode,
    required this.severity,
  });

  factory ValidationErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorModelToJson(this);
}
