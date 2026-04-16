// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLeaveRequestModel _$GetLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetLeaveRequestModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => LeaveRequestData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) =>
              LeaveRequestValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLeaveRequestModelToJson(
        GetLeaveRequestModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

LeaveRequestData _$LeaveRequestDataFromJson(Map<String, dynamic> json) =>
    LeaveRequestData(
      id: json['id'] as String?,
      requestorId: json['requestorId'] as String?,
      requestorName: json['requestorName'] as String?,
      requestor: json['requestor'],
      number: json['number'] as String?,
      leavePeriod: json['leavePeriod'] == null
          ? null
          : LeavePeriod.fromJson(json['leavePeriod'] as Map<String, dynamic>),
      emergencyInfo: json['emergencyInfo'] == null
          ? null
          : EmergencyInfo.fromJson(
              json['emergencyInfo'] as Map<String, dynamic>),
      leaveType: json['leaveType'] == null
          ? null
          : LeaveType.fromJson(json['leaveType'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$LeaveRequestDataToJson(LeaveRequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestorId': instance.requestorId,
      'requestorName': instance.requestorName,
      'requestor': instance.requestor,
      'number': instance.number,
      'leavePeriod': instance.leavePeriod,
      'emergencyInfo': instance.emergencyInfo,
      'leaveType': instance.leaveType,
      'status': instance.status,
      'reason': instance.reason,
    };

LeavePeriod _$LeavePeriodFromJson(Map<String, dynamic> json) => LeavePeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$LeavePeriodToJson(LeavePeriod instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

EmergencyInfo _$EmergencyInfoFromJson(Map<String, dynamic> json) =>
    EmergencyInfo(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$EmergencyInfoToJson(EmergencyInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };

LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => LeaveType(
      id: json['id'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      workType: json['workType'],
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeaveTypeToJson(LeaveType instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'type': instance.type,
      'workType': instance.workType,
      'status': instance.status,
    };

LeaveRequestValidationError _$LeaveRequestValidationErrorFromJson(
        Map<String, dynamic> json) =>
    LeaveRequestValidationError(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: (json['severity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeaveRequestValidationErrorToJson(
        LeaveRequestValidationError instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'severity': instance.severity,
    };
