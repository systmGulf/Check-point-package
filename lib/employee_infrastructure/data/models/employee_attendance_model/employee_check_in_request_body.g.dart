// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_check_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckInRequestBody _$EmployeeCheckInRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckInRequestBody(
      attendeeData: json['attendeeData'] == null
          ? null
          : AttendeeData.fromJson(json['attendeeData'] as Map<String, dynamic>),
      attendanceRecord: json['attendanceRecord'] == null
          ? null
          : AttendanceRecord.fromJson(
              json['attendanceRecord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeCheckInRequestBodyToJson(
        EmployeeCheckInRequestBody instance) =>
    <String, dynamic>{
      'attendeeData': instance.attendeeData,
      'attendanceRecord': instance.attendanceRecord,
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

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) =>
    AttendanceRecord(
      date: json['date'] as String?,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
    );

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'date': instance.date,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
    };
