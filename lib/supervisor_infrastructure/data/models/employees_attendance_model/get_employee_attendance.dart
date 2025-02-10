import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_employee_attendance.g.dart';

@JsonSerializable()
class SupervisorGetAllEmployeesAttendanceModel {
  SupervisorGetAllEmployeesAttendanceValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  SupervisorGetAllEmployeesAttendanceModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory SupervisorGetAllEmployeesAttendanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$SupervisorGetAllEmployeesAttendanceModelFromJson(json);
}

@JsonSerializable()
class SupervisorGetAllEmployeesAttendanceValue {
  List<SupervisorGetAllEmployeesAttendanceData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  SupervisorGetAllEmployeesAttendanceValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});

 factory SupervisorGetAllEmployeesAttendanceValue.fromJson(
          Map<String, dynamic> json) =>
      _$SupervisorGetAllEmployeesAttendanceValueFromJson(json);
}

@JsonSerializable()
class SupervisorGetAllEmployeesAttendanceData {
  int? id;
  String? employeeName;
  String? attendanceDate;
  String? clockInTime;
  String? clockOutTime;
  String? dayHours;
  double? totalHours;
  String? location;
  String? area;
  String? employeeId;
  String? customerId;
  String? employeeImage;

  SupervisorGetAllEmployeesAttendanceData(
      {this.id,
      this.employeeName,
      this.attendanceDate,
      this.clockInTime,
      this.clockOutTime,
      this.dayHours,
      this.totalHours,
      this.location,
      this.area,
      this.employeeId,
      this.customerId, this.employeeImage});
  factory SupervisorGetAllEmployeesAttendanceData.fromJson(
          Map<String, dynamic> json) =>
      _$SupervisorGetAllEmployeesAttendanceDataFromJson(json);
}
