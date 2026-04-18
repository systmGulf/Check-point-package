import 'package:json_annotation/json_annotation.dart';

part 'get_employee_attendance.g.dart';

@JsonSerializable()
class SupervisorGetAllEmployeesAttendanceModel {
  final List<AttendanceItem>? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  SupervisorGetAllEmployeesAttendanceModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory SupervisorGetAllEmployeesAttendanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$SupervisorGetAllEmployeesAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SupervisorGetAllEmployeesAttendanceModelToJson(this);
}

@JsonSerializable()
class AttendanceItem {
  final String? id;
  final AttendeeData? attendeeData;
  final String? attendanceRecordId;
  final String? attendanceDate;
  final String? checkIn;
  final String? checkOut;
  final String? createdDate;
  final String? updatedDate;

  AttendanceItem({
    this.id,
    this.attendeeData,
    this.attendanceRecordId,
    this.attendanceDate,
    this.checkIn,
    this.checkOut,
    this.createdDate,
    this.updatedDate,
  });

  factory AttendanceItem.fromJson(Map<String, dynamic> json) =>
      _$AttendanceItemFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceItemToJson(this);
}

@JsonSerializable()
class AttendeeData {
  final String? name;
  final String? attendeeId;

  AttendeeData({
    this.name,
    this.attendeeId,
  });

  factory AttendeeData.fromJson(Map<String, dynamic> json) =>
      _$AttendeeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeDataToJson(this);
}