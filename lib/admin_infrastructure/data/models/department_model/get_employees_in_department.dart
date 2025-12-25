import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_employees_in_department.g.dart';

@JsonSerializable()
class GetEmployeesInDepartmentModel {
  GetEmployeesInDepartmentValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  GetEmployeesInDepartmentModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory GetEmployeesInDepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeesInDepartmentModelFromJson(json);
}

@JsonSerializable()
class GetEmployeesInDepartmentValue {
  List<GetEmployeesInDepartmentData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  GetEmployeesInDepartmentValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});
  factory GetEmployeesInDepartmentValue.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeesInDepartmentValueFromJson(json);
}

@JsonSerializable()
class GetEmployeesInDepartmentData {
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
  String? imageUrl;

  GetEmployeesInDepartmentData(
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
      this.mobileId, this.imageUrl});

  factory GetEmployeesInDepartmentData.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeesInDepartmentDataFromJson(json);
}
