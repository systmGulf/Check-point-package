import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_leave_requests.g.dart';

@JsonSerializable()
class EmployeeLeaveRequestsModel {
  List<EmployeeLeaveRequestsData>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  EmployeeLeaveRequestsModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory EmployeeLeaveRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeLeaveRequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeLeaveRequestsModelToJson(this);
}

@JsonSerializable()
class EmployeeLeaveRequestsData {
  String? id;
  String? requestorId;
  String? requestorName;
  dynamic requestor;
  String? number;
  LeavePeriod? leavePeriod;
  EmergencyInfo? emergencyInfo;
  EmployeeLeaveType? leaveType;
  int? status;
  String? reason;

  EmployeeLeaveRequestsData({
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

  factory EmployeeLeaveRequestsData.fromJson(Map<String, dynamic> json) =>
      _$EmployeeLeaveRequestsDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeLeaveRequestsDataToJson(this);
}

@JsonSerializable()
class LeavePeriod {
  String? startDate;
  String? endDate;

  LeavePeriod({
    this.startDate,
    this.endDate,
  });

  factory LeavePeriod.fromJson(Map<String, dynamic> json) =>
      _$LeavePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$LeavePeriodToJson(this);
}

@JsonSerializable()
class EmergencyInfo {
  String? email;
  String? phone;

  EmergencyInfo({
    this.email,
    this.phone,
  });

  factory EmergencyInfo.fromJson(Map<String, dynamic> json) =>
      _$EmergencyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyInfoToJson(this);
}

@JsonSerializable()
class EmployeeLeaveType {
  String? id;
  String? code;
  String? type;
  dynamic workType;
  int? status;

  EmployeeLeaveType({
    this.id,
    this.code,
    this.type,
    this.workType,
    this.status,
  });

  factory EmployeeLeaveType.fromJson(Map<String, dynamic> json) =>
      _$EmployeeLeaveTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeLeaveTypeToJson(this);
}
