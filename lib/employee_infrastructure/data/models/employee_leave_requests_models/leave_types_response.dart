import 'package:freezed_annotation/freezed_annotation.dart';
part 'leave_types_response.g.dart';

@JsonSerializable()
class LeaveTypeResponse {
  List<LeaveTypeValue>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  LeaveTypeResponse(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});
  factory LeaveTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeResponseFromJson(json);
}

@JsonSerializable()
class LeaveTypeValue {
  String? id;
  String? code;
  String? type;
  WorkType? workType;
  int? status;

  LeaveTypeValue({this.id, this.code, this.type, this.workType, this.status});

  factory LeaveTypeValue.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeValueFromJson(json);
}

@JsonSerializable()
class WorkType {
  String? id;
  String? code;
  String? type;
  int? percentage;
  List<dynamic>? leaveTypes;

  WorkType({this.id, this.code, this.type, this.percentage, this.leaveTypes});

  factory WorkType.fromJson(Map<String, dynamic> json) =>
      _$WorkTypeFromJson(json);
}
