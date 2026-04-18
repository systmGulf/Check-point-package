// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leave_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLeaveTypeModel _$GetLeaveTypeModelFromJson(Map<String, dynamic> json) =>
    GetLeaveTypeModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => LeaveTypeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$GetLeaveTypeModelToJson(GetLeaveTypeModel instance) =>
    <String, dynamic>{
      'value': instance.value?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

LeaveTypeValue _$LeaveTypeValueFromJson(Map<String, dynamic> json) =>
    LeaveTypeValue(
      id: json['id'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      workType: json['workType'] == null
          ? null
          : WorkType.fromJson(json['workType'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeaveTypeValueToJson(LeaveTypeValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'type': instance.type,
      'workType': instance.workType?.toJson(),
      'status': instance.status,
    };

WorkType _$WorkTypeFromJson(Map<String, dynamic> json) => WorkType(
      id: json['id'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      percentage: (json['percentage'] as num?)?.toInt(),
      leaveTypes: json['leaveTypes'] as List<dynamic>?,
    );

Map<String, dynamic> _$WorkTypeToJson(WorkType instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'type': instance.type,
      'percentage': instance.percentage,
      'leaveTypes': instance.leaveTypes,
    };
