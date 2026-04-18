import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_check_in_request_body.g.dart';

@JsonSerializable()
class EmployeeCheckInRequestBody extends Equatable {
  final AttendeeData? attendeeData;
  final AttendanceRecord? attendanceRecord;

  const EmployeeCheckInRequestBody({
    this.attendeeData,
    this.attendanceRecord,
  });

  factory EmployeeCheckInRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EmployeeCheckInRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCheckInRequestBodyToJson(this);

  @override
  List<Object?> get props => [attendeeData, attendanceRecord];
}

@JsonSerializable()
class AttendeeData extends Equatable {
  final String? name;
  final String? attendeeId;

  const AttendeeData({
    this.name,
    this.attendeeId,
  });

  factory AttendeeData.fromJson(Map<String, dynamic> json) =>
      _$AttendeeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeDataToJson(this);

  @override
  List<Object?> get props => [name, attendeeId];
}

@JsonSerializable()
class AttendanceRecord extends Equatable {
  final String? date;
  final String? checkIn;
  final String? checkOut;

  const AttendanceRecord({
    this.date,
    this.checkIn,
    this.checkOut,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceRecordToJson(this);

  @override
  List<Object?> get props => [date, checkIn, checkOut];
}