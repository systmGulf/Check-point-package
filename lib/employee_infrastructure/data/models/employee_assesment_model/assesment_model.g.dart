// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assesment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeAssessmentModel _$EmployeeAssessmentModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeAssessmentModel(
      id: json['id'] as String?,
      employeeId: json['employeeId'] as String?,
      assessmentId: json['assessmentId'] as String?,
      assessment: json['assessment'] == null
          ? null
          : AssesmentModel.fromJson(json['assessment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeAssessmentModelToJson(
        EmployeeAssessmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'assessmentId': instance.assessmentId,
      'assessment': instance.assessment?.toJson(),
    };

AssesmentModel _$AssesmentModelFromJson(Map<String, dynamic> json) =>
    AssesmentModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      minutes: (json['minutes'] as num?)?.toInt(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$AssesmentModelToJson(AssesmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'minutes': instance.minutes,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate?.toIso8601String(),
    };

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      text: json['text'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'grade': instance.grade,
      'options': instance.options?.map((e) => e.toJson()).toList(),
    };

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) => OptionModel(
      text: json['text'] as String?,
      isCorrect: json['isCorrect'] as bool?,
    );

Map<String, dynamic> _$OptionModelToJson(OptionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isCorrect': instance.isCorrect,
    };
