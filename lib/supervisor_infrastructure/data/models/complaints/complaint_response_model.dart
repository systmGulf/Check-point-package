import 'package:json_annotation/json_annotation.dart';

part 'complaint_response_model.g.dart';

@JsonSerializable()
class ComplaintResponseModel {
  final List<ComplaintItem>? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<String>? errors;
  final List<ComplaintValidationError>? validationErrors;

  ComplaintResponseModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory ComplaintResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ComplaintResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintResponseModelToJson(this);
}

@JsonSerializable()
class ComplaintItem {
  final String? id;
  final String? employeeId;
  final String? employeeName;
  final String? subject;
  final String? description;
  final int? status;
  final String? resolutionNote;

  ComplaintItem({
    this.id,
    this.employeeId,
    this.employeeName,
    this.subject,
    this.description,
    this.status,
    this.resolutionNote,
  });

  factory ComplaintItem.fromJson(Map<String, dynamic> json) =>
      _$ComplaintItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintItemToJson(this);
}

@JsonSerializable()
class ComplaintValidationError {
  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  ComplaintValidationError({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  factory ComplaintValidationError.fromJson(Map<String, dynamic> json) =>
      _$ComplaintValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintValidationErrorToJson(this);
}
