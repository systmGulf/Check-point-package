// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_survey_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitSurveyRequestBody _$SubmitSurveyRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SubmitSurveyRequestBody(
      surveyId: json['surveyId'] as String,
      employeeId: json['employeeId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) =>
              SurveyAnswerRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitSurveyRequestBodyToJson(
        SubmitSurveyRequestBody instance) =>
    <String, dynamic>{
      'surveyId': instance.surveyId,
      'employeeId': instance.employeeId,
      'answers': instance.answers,
    };

SurveyAnswerRequestModel _$SurveyAnswerRequestModelFromJson(
        Map<String, dynamic> json) =>
    SurveyAnswerRequestModel(
      questionId: json['questionId'] as String,
      answerText: json['answerText'] as String,
      questionText: json['questionText'] as String,
    );

Map<String, dynamic> _$SurveyAnswerRequestModelToJson(
        SurveyAnswerRequestModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerText': instance.answerText,
      'questionText': instance.questionText,
    };
