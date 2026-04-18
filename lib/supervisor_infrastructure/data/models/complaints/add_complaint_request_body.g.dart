// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_complaint_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddComplaintRequestBody _$AddComplaintRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddComplaintRequestBody(
      subject: json['subject'] as String,
      description: json['description'] as String,
      employeeId: json['employeeId'] as String,
    );

Map<String, dynamic> _$AddComplaintRequestBodyToJson(
        AddComplaintRequestBody instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'description': instance.description,
      'employeeId': instance.employeeId,
    };
