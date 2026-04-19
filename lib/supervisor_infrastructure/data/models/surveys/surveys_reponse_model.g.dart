// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveys_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyResponseModel _$SurveyResponseModelFromJson(Map<String, dynamic> json) =>
    SurveyResponseModel(
      value: (json['value'] as List<dynamic>)
          .map((e) => SurveyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num).toInt(),
      isSuccess: json['isSuccess'] as bool,
      successMessage: json['successMessage'] as String,
      correlationId: json['correlationId'] as String,
      errors: json['errors'] as List<dynamic>,
      validationErrors: json['validationErrors'] as List<dynamic>,
    );

Map<String, dynamic> _$SurveyResponseModelToJson(
        SurveyResponseModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) => SurveyModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: (json['status'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isAnonymous: json['isAnonymous'] as bool,
      notes: json['notes'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => SurveyQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyModelToJson(SurveyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isAnonymous': instance.isAnonymous,
      'notes': instance.notes,
      'questions': instance.questions,
    };

SurveyQuestionModel _$SurveyQuestionModelFromJson(Map<String, dynamic> json) =>
    SurveyQuestionModel(
      id: json['id'] as String,
      surveyId: json['surveyId'] as String,
      text: json['text'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyQuestionModelToJson(
        SurveyQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surveyId': instance.surveyId,
      'text': instance.text,
      'order': instance.order,
    };
