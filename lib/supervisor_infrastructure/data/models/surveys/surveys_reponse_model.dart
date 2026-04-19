import 'package:json_annotation/json_annotation.dart';

part 'surveys_reponse_model.g.dart';

@JsonSerializable()
class SurveyResponseModel {
  final List<SurveyModel> value;
  final int status;
  final bool isSuccess;
  final String successMessage;
  final String correlationId;
  final List<dynamic> errors;
  final List<dynamic> validationErrors;

  SurveyResponseModel({
    required this.value,
    required this.status,
    required this.isSuccess,
    required this.successMessage,
    required this.correlationId,
    required this.errors,
    required this.validationErrors,
  });

  factory SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseModelToJson(this);
}

@JsonSerializable()
class SurveyModel {
  final String id;
  final String title;
  final String description;
  final int status;
  final DateTime startDate;
  final DateTime endDate;
  final bool isAnonymous;
  final String notes;
  final List<SurveyQuestionModel> questions;

  SurveyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.isAnonymous,
    required this.notes,
    required this.questions,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);
}

@JsonSerializable()
class SurveyQuestionModel {
  final String id;
  final String surveyId;
  final String text;
  final int order;

  SurveyQuestionModel({
    required this.id,
    required this.surveyId,
    required this.text,
    required this.order,
  });

  factory SurveyQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyQuestionModelToJson(this);
}
