// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveySubmitResponseModel _$SurveySubmitResponseModelFromJson(
        Map<String, dynamic> json) =>
    SurveySubmitResponseModel(
      value:
          SurveySubmissionModel.fromJson(json['value'] as Map<String, dynamic>),
      status: (json['status'] as num).toInt(),
      isSuccess: json['isSuccess'] as bool,
      successMessage: json['successMessage'] as String,
      correlationId: json['correlationId'] as String,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      validationErrors: (json['validationErrors'] as List<dynamic>)
          .map((e) => ValidationErrorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveySubmitResponseModelToJson(
        SurveySubmitResponseModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

SurveySubmissionModel _$SurveySubmissionModelFromJson(
        Map<String, dynamic> json) =>
    SurveySubmissionModel(
      id: json['id'] as String,
      surveyId: json['surveyId'] as String,
      surveyTitle: json['surveyTitle'] as String,
      employeeId: json['employeeId'] as String,
      submittedAt: DateTime.parse(json['submittedAt'] as String),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => SurveyAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveySubmissionModelToJson(
        SurveySubmissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surveyId': instance.surveyId,
      'surveyTitle': instance.surveyTitle,
      'employeeId': instance.employeeId,
      'submittedAt': instance.submittedAt.toIso8601String(),
      'answers': instance.answers,
    };

SurveyAnswerModel _$SurveyAnswerModelFromJson(Map<String, dynamic> json) =>
    SurveyAnswerModel(
      questionId: json['questionId'] as String,
      answerText: json['answerText'] as String,
    );

Map<String, dynamic> _$SurveyAnswerModelToJson(SurveyAnswerModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerText': instance.answerText,
    };

ValidationErrorModel _$ValidationErrorModelFromJson(
        Map<String, dynamic> json) =>
    ValidationErrorModel(
      identifier: json['identifier'] as String,
      errorMessage: json['errorMessage'] as String,
      errorCode: json['errorCode'] as String,
      severity: (json['severity'] as num).toInt(),
    );

Map<String, dynamic> _$ValidationErrorModelToJson(
        ValidationErrorModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'severity': instance.severity,
    };
