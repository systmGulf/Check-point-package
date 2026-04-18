// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_check_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckInRequestBody _$EmployeeCheckInRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckInRequestBody(
      date: json['date'] as String,
      checkIn: json['checkIn'] as String,
      checkOut: json['checkOut'] as String,
    );

Map<String, dynamic> _$EmployeeCheckInRequestBodyToJson(
        EmployeeCheckInRequestBody instance) =>
    <String, dynamic>{
      'date': instance.date,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
    };
