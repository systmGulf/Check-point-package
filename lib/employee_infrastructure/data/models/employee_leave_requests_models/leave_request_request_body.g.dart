// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequestRequestBody _$LeaveRequestRequestBodyFromJson(
        Map<String, dynamic> json) =>
    LeaveRequestRequestBody(
      requestorId: json['requestorId'] as String,
      requestorName: json['requestorName'] as String,
      number: json['number'] as String,
      reason: json['reason'] as String,
      leavePeriod:
          LeavePeriod.fromJson(json['leavePeriod'] as Map<String, dynamic>),
      emergencyInfo:
          EmergencyInfo.fromJson(json['emergencyInfo'] as Map<String, dynamic>),
      leaveTypeId: json['leaveTypeId'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$LeaveRequestRequestBodyToJson(
        LeaveRequestRequestBody instance) =>
    <String, dynamic>{
      'requestorId': instance.requestorId,
      'requestorName': instance.requestorName,
      'number': instance.number,
      'reason': instance.reason,
      'leavePeriod': instance.leavePeriod.toJson(),
      'emergencyInfo': instance.emergencyInfo.toJson(),
      'leaveTypeId': instance.leaveTypeId,
      'status': instance.status,
    };

LeavePeriod _$LeavePeriodFromJson(Map<String, dynamic> json) => LeavePeriod(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$LeavePeriodToJson(LeavePeriod instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

EmergencyInfo _$EmergencyInfoFromJson(Map<String, dynamic> json) =>
    EmergencyInfo(
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$EmergencyInfoToJson(EmergencyInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };
