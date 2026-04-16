// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_tasks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeTaksResponse _$EmployeeTaksResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeTaksResponse(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => EmployeeTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$EmployeeTaksResponseToJson(
        EmployeeTaksResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

EmployeeTaskItem _$EmployeeTaskItemFromJson(Map<String, dynamic> json) =>
    EmployeeTaskItem(
      employeeId: json['employeeId'] as String?,
      taskId: json['taskId'] as String?,
      deadLine: json['deadLine'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      state: (json['state'] as num?)?.toInt(),
      taskTitle: json['taskTitle'] as String?,
      taskCode: json['taskCode'] as String?,
      taskDescription: json['taskDescription'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EmployeeTaskItemToJson(EmployeeTaskItem instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'taskId': instance.taskId,
      'deadLine': instance.deadLine,
      'priority': instance.priority,
      'state': instance.state,
      'taskTitle': instance.taskTitle,
      'taskCode': instance.taskCode,
      'taskDescription': instance.taskDescription,
      'id': instance.id,
    };
