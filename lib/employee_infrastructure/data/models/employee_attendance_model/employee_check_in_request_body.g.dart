// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_check_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckInRequestBody _$EmployeeCheckInRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckInRequestBody(
      json['customerId'] as String?,
      json['employeeImage'] as String?,
      employeeIdd: json['employeeId'] as String,
      area: json['area'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$EmployeeCheckInRequestBodyToJson(
        EmployeeCheckInRequestBody instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeIdd,
      'area': instance.area,
      'customerId': instance.customerId,
      'location': instance.location,
      'employeeImage': instance.employeeImage,
    };
