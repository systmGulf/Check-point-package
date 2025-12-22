import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_attendace_model.g.dart';
@JsonSerializable()
class UserAttendanceModel {
  UserAttendanceValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  UserAttendanceModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

 factory UserAttendanceModel.fromJson(Map<String, dynamic> json) => _$UserAttendanceModelFromJson(json);
}
@JsonSerializable()

class UserAttendanceValue {
  List<UserAttendanceData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  UserAttendanceValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});

 factory UserAttendanceValue.fromJson(Map<String, dynamic> json) => _$UserAttendanceValueFromJson(json);
}
@JsonSerializable()

class UserAttendanceData {
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
  String? customerName;
  String? employeeImage;
  bool? isEarly, isLate;

  UserAttendanceData(
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
      this.customerId, this.customerName, this.employeeImage, this.isEarly, this.isLate});

 factory UserAttendanceData.fromJson(Map<String, dynamic> json) => _$UserAttendanceDataFromJson(json);
}
