// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employee_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupervisorGetAllEmployeesAttendanceModel
    _$SupervisorGetAllEmployeesAttendanceModelFromJson(
            Map<String, dynamic> json) =>
        SupervisorGetAllEmployeesAttendanceModel(
          value: (json['value'] as List<dynamic>?)
              ?.map((e) => AttendanceItem.fromJson(e as Map<String, dynamic>))
              .toList(),
          status: (json['status'] as num?)?.toInt(),
          isSuccess: json['isSuccess'] as bool?,
          successMessage: json['successMessage'] as String?,
          correlationId: json['correlationId'] as String?,
          errors: json['errors'] as List<dynamic>?,
          validationErrors: json['validationErrors'] as List<dynamic>?,
        );

Map<String, dynamic> _$SupervisorGetAllEmployeesAttendanceModelToJson(
        SupervisorGetAllEmployeesAttendanceModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

AttendanceItem _$AttendanceItemFromJson(Map<String, dynamic> json) =>
    AttendanceItem(
      id: json['id'] as String?,
      attendeeData: json['attendeeData'] == null
          ? null
          : AttendeeData.fromJson(json['attendeeData'] as Map<String, dynamic>),
      attendanceRecordId: json['attendanceRecordId'] as String?,
      attendanceDate: json['attendanceDate'] as String?,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
    );

Map<String, dynamic> _$AttendanceItemToJson(AttendanceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendeeData': instance.attendeeData,
      'attendanceRecordId': instance.attendanceRecordId,
      'attendanceDate': instance.attendanceDate,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
    };

AttendeeData _$AttendeeDataFromJson(Map<String, dynamic> json) => AttendeeData(
      name: json['name'] as String?,
      attendeeId: json['attendeeId'] as String?,
    );

Map<String, dynamic> _$AttendeeDataToJson(AttendeeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'attendeeId': instance.attendeeId,
    };
