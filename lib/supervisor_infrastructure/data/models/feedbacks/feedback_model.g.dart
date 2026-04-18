// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => FeedbackItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

FeedbackItem _$FeedbackItemFromJson(Map<String, dynamic> json) => FeedbackItem(
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      isReviewed: json['isReviewed'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FeedbackItemToJson(FeedbackItem instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'subject': instance.subject,
      'message': instance.message,
      'rating': instance.rating,
      'isReviewed': instance.isReviewed,
      'id': instance.id,
    };
