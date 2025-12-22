// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employee_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupervisorGetAllEmployeesAttendanceModel
    _$SupervisorGetAllEmployeesAttendanceModelFromJson(
            Map<String, dynamic> json) =>
        SupervisorGetAllEmployeesAttendanceModel(
          value: json['value'] == null
              ? null
              : SupervisorGetAllEmployeesAttendanceValue.fromJson(
                  json['value'] as Map<String, dynamic>),
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

SupervisorGetAllEmployeesAttendanceValue
    _$SupervisorGetAllEmployeesAttendanceValueFromJson(
            Map<String, dynamic> json) =>
        SupervisorGetAllEmployeesAttendanceValue(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => SupervisorGetAllEmployeesAttendanceData.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          totalCount: (json['totalCount'] as num?)?.toInt(),
          pageCount: (json['pageCount'] as num?)?.toInt(),
          hasNextPage: json['hasNextPage'] as bool?,
          hasPreviousPage: json['hasPreviousPage'] as bool?,
          start: (json['start'] as num?)?.toInt(),
          end: (json['end'] as num?)?.toInt(),
        );

Map<String, dynamic> _$SupervisorGetAllEmployeesAttendanceValueToJson(
        SupervisorGetAllEmployeesAttendanceValue instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'start': instance.start,
      'end': instance.end,
    };

SupervisorGetAllEmployeesAttendanceData
    _$SupervisorGetAllEmployeesAttendanceDataFromJson(
            Map<String, dynamic> json) =>
        SupervisorGetAllEmployeesAttendanceData(
          id: (json['id'] as num?)?.toInt(),
          employeeName: json['employeeName'] as String?,
          attendanceDate: json['attendanceDate'] as String?,
          clockInTime: json['clockInTime'] as String?,
          clockOutTime: json['clockOutTime'] as String?,
          dayHours: json['dayHours'] as String?,
          totalHours: (json['totalHours'] as num?)?.toDouble(),
          location: json['location'] as String?,
          area: json['area'] as String?,
          employeeId: json['employeeId'] as String?,
          customerId: json['customerId'] as String?,
          employeeImage: json['employeeImage'] as String?,
          isEarly: json['isEarly'] as bool?,
          isLate: json['isLate'] as bool?,
        );

Map<String, dynamic> _$SupervisorGetAllEmployeesAttendanceDataToJson(
        SupervisorGetAllEmployeesAttendanceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'attendanceDate': instance.attendanceDate,
      'clockInTime': instance.clockInTime,
      'clockOutTime': instance.clockOutTime,
      'dayHours': instance.dayHours,
      'totalHours': instance.totalHours,
      'location': instance.location,
      'area': instance.area,
      'employeeId': instance.employeeId,
      'customerId': instance.customerId,
      'employeeImage': instance.employeeImage,
      'isEarly': instance.isEarly,
      'isLate': instance.isLate,
    };
