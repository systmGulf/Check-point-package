import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_tasks_response_model.g.dart';

@JsonSerializable()
class EmployeeTaksResponse {
  List<EmployeeTaskItem>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  EmployeeTaksResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory EmployeeTaksResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeTaksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeTaksResponseToJson(this);
}

@JsonSerializable()
class EmployeeTaskItem {
  String? employeeId;
  String? taskId;
  String? deadLine;
  int? priority;
  int? state;
  String? taskTitle;
  String? taskCode;
  String? taskDescription;
  String? id;

  EmployeeTaskItem({
    this.employeeId,
    this.taskId,
    this.deadLine,
    this.priority,
    this.state,
    this.taskTitle,
    this.taskCode,
    this.taskDescription,
    this.id,
  });

  factory EmployeeTaskItem.fromJson(Map<String, dynamic> json) =>
      _$EmployeeTaskItemFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeTaskItemToJson(this);
}
