import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_leave_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLeaveTypeModel extends Equatable {
  final List<LeaveTypeValue>? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  const GetLeaveTypeModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory GetLeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GetLeaveTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetLeaveTypeModelToJson(this);

  @override
  List<Object?> get props => [
        value,
        status,
        isSuccess,
        successMessage,
        correlationId,
        errors,
        validationErrors,
      ];
}

@JsonSerializable(explicitToJson: true)
class LeaveTypeValue extends Equatable {
  final String? id;
  final String? code;
  final String? type;
  final WorkType? workType;
  final int? status;

  const LeaveTypeValue({
    this.id,
    this.code,
    this.type,
    this.workType,
    this.status,
  });

  factory LeaveTypeValue.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeValueFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeValueToJson(this);

  @override
  List<Object?> get props => [id, code, type, workType, status];
}

@JsonSerializable(explicitToJson: true)
class WorkType extends Equatable {
  final String? id;
  final String? code;
  final String? type;
  final int? percentage;
  final List<dynamic>? leaveTypes;

  const WorkType({
    this.id,
    this.code,
    this.type,
    this.percentage,
    this.leaveTypes,
  });

  factory WorkType.fromJson(Map<String, dynamic> json) =>
      _$WorkTypeFromJson(json);

  Map<String, dynamic> toJson() => _$WorkTypeToJson(this);

  @override
  List<Object?> get props => [id, code, type, percentage, leaveTypes];
}
