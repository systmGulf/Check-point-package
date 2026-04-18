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

  factory UserAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserAttendanceModelFromJson(json);
}

@JsonSerializable()
class UserAttendanceValue {
  List<UserAttendanceData>? data;
  String? id;
  String? date;
  String? checkIn;
  String? checkOut;

  UserAttendanceValue({
    this.data,
    this.id,
    this.date,
    this.checkIn,
    this.checkOut,
  });

  factory UserAttendanceValue.fromJson(Map<String, dynamic> json) =>
      _$UserAttendanceValueFromJson(json);
}

@JsonSerializable()
class UserAttendanceData {
  final String? id;
  final String? title;
  final String? body;
  final DateTime? publishAt;
  final DateTime? expireAt;
  final String? employeeId;
  final String? employeeName;
  final bool? isPublished;

  UserAttendanceData(
      {this.id,
      this.title,
      this.body,
      this.publishAt,
      this.expireAt,
      this.employeeId,
      this.employeeName,
      this.isPublished});

  factory UserAttendanceData.fromJson(Map<String, dynamic> json) =>
      _$UserAttendanceDataFromJson(json);
}
