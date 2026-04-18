// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_feedback_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFeedbackRequest _$AddFeedbackRequestFromJson(Map<String, dynamic> json) =>
    AddFeedbackRequest(
      subject: json['subject'] as String,
      message: json['message'] as String,
      rating: (json['rating'] as num).toInt(),
      employeeId: json['employeeId'] as String,
    );

Map<String, dynamic> _$AddFeedbackRequestToJson(AddFeedbackRequest instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'message': instance.message,
      'rating': instance.rating,
      'employeeId': instance.employeeId,
    };
