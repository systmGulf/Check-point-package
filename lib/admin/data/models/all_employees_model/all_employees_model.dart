import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_employees_model.g.dart';

@JsonSerializable()
class AllEmployeesModel {
  GetAllEmployeesValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  AllEmployeesModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory AllEmployeesModel.fromJson(Map<String, dynamic> json) =>
      _$AllEmployeesModelFromJson(json);
}

@JsonSerializable()
class GetAllEmployeesValue {
  List<EmployeeData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  GetAllEmployeesValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});
  factory GetAllEmployeesValue.fromJson(Map<String, dynamic> json) =>
      _$GetAllEmployeesValueFromJson(json);
}

@JsonSerializable()
class EmployeeData {
  String? position;
  String? departmentName;
  int? departmentId;
  String? branchName;
  int? branchId;
  String? role;
  bool? canAddAttendance;
  bool? canAddPlan;
  String? id;
  String? userName;
  String? name;
  String? mobileId;
  List<String>? deviceTokens;

  EmployeeData(
      {this.position,
      this.departmentName,
      this.departmentId,
      this.branchName,
      this.branchId,
      this.role,
      this.canAddAttendance,
      this.canAddPlan,
      this.id,
      this.userName,
      this.name,
      this.mobileId, this.deviceTokens});

  factory EmployeeData.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDataFromJson(json);
}
