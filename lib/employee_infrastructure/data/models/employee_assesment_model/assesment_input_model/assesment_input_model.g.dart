// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assesment_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssesmentInputModel _$AssesmentInputModelFromJson(Map<String, dynamic> json) =>
    AssesmentInputModel(
      employeeAssessmentId: json['employeeAssessmentId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssesmentInputModelToJson(
        AssesmentInputModel instance) =>
    <String, dynamic>{
      'employeeAssessmentId': instance.employeeAssessmentId,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      questionIndex: (json['questionIndex'] as num).toInt(),
      selectedOptionIndex: (json['selectedOptionIndex'] as num).toInt(),
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'questionIndex': instance.questionIndex,
      'selectedOptionIndex': instance.selectedOptionIndex,
    };
