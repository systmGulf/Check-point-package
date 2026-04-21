// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_allowance_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAllowanceRequestBody _$RequestAllowanceRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RequestAllowanceRequestBody(
      beneficiaryAllowanceId: json['beneficiaryAllowanceId'] as String?,
      allowanceId: json['allowanceId'] as String?,
      employeeId: json['employeeId'] as String?,
      requestNotes: json['requestNotes'] as String?,
    );

Map<String, dynamic> _$RequestAllowanceRequestBodyToJson(
        RequestAllowanceRequestBody instance) =>
    <String, dynamic>{
      'beneficiaryAllowanceId': instance.beneficiaryAllowanceId,
      'allowanceId': instance.allowanceId,
      'employeeId': instance.employeeId,
      'requestNotes': instance.requestNotes,
    };
