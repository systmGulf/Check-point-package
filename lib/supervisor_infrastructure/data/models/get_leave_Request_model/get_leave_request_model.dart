import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_leave_request_model.g.dart';

@JsonSerializable()
class GetLeaveRequestModel {
  List<LeaveRequestData>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<String>? errors;
  List<LeaveRequestValidationError>? validationErrors;

  GetLeaveRequestModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory GetLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetLeaveRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetLeaveRequestModelToJson(this);
}

@JsonSerializable()
class LeaveRequestData {
  String? id;
  String? requestorId;
  String? requestorName;
  dynamic requestor;
  String? number;
  LeavePeriod? leavePeriod;
  EmergencyInfo? emergencyInfo;
  LeaveType? leaveType;
  int? status;
  String? reason;

  LeaveRequestData({
    this.id,
    this.requestorId,
    this.requestorName,
    this.requestor,
    this.number,
    this.leavePeriod,
    this.emergencyInfo,
    this.leaveType,
    this.status,
    this.reason,
  });

  factory LeaveRequestData.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveRequestDataToJson(this);
}

@JsonSerializable()
class LeavePeriod {
  String? startDate;
  String? endDate;

  LeavePeriod({this.startDate, this.endDate});

  factory LeavePeriod.fromJson(Map<String, dynamic> json) =>
      _$LeavePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$LeavePeriodToJson(this);
}

@JsonSerializable()
class EmergencyInfo {
  String? email;
  String? phone;

  EmergencyInfo({this.email, this.phone});

  factory EmergencyInfo.fromJson(Map<String, dynamic> json) =>
      _$EmergencyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyInfoToJson(this);
}

@JsonSerializable()
class LeaveType {
  String? id;
  String? code;
  String? type;
  dynamic workType;
  int? status;

  LeaveType({this.id, this.code, this.type, this.workType, this.status});

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeToJson(this);
}

@JsonSerializable()
class LeaveRequestValidationError {
  String? identifier;
  String? errorMessage;
  String? errorCode;
  int? severity;

  LeaveRequestValidationError({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  factory LeaveRequestValidationError.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveRequestValidationErrorToJson(this);
}
