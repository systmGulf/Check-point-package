// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFeedbackModel _$AddFeedbackModelFromJson(Map<String, dynamic> json) =>
    AddFeedbackModel(
      value: json['value'] == null
          ? null
          : FeedbackItem.fromJson(json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$AddFeedbackModelToJson(AddFeedbackModel instance) =>
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
