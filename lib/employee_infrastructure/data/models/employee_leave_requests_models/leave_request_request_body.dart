import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_request_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class LeaveRequestRequestBody {
  final String requestorId;
  final String requestorName;
  final String number;
  final String reason;
  final LeavePeriod leavePeriod;
  final EmergencyInfo emergencyInfo;
  final String leaveTypeId;
  final int status;

  LeaveRequestRequestBody({
    required this.requestorId,
    required this.requestorName,
    required this.number,
    required this.reason,
    required this.leavePeriod,
    required this.emergencyInfo,
    required this.leaveTypeId,
    required this.status,
  });

  factory LeaveRequestRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveRequestRequestBodyToJson(this);
}

@JsonSerializable()
class LeavePeriod {
  final String startDate;
  final String endDate;

  LeavePeriod({
    required this.startDate,
    required this.endDate,
  });

  factory LeavePeriod.fromJson(Map<String, dynamic> json) =>
      _$LeavePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$LeavePeriodToJson(this);
}

@JsonSerializable()
class EmergencyInfo {
  final String email;
  final String phone;

  EmergencyInfo({
    required this.email,
    required this.phone,
  });

  factory EmergencyInfo.fromJson(Map<String, dynamic> json) =>
      _$EmergencyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyInfoToJson(this);
}
