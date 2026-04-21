import 'package:freezed_annotation/freezed_annotation.dart';

import 'beneficiary_allowances_response.dart';

part 'assign_allowance_to_employee_models.g.dart';

@JsonSerializable()
class AssignAllowanceToEmployeeRequestBody {
  const AssignAllowanceToEmployeeRequestBody({
    required this.allowanceId,
    @JsonKey(name: 'empId') required this.employeeId,
  });

  final String allowanceId;
  @JsonKey(name: 'empId')
  final String employeeId;

  factory AssignAllowanceToEmployeeRequestBody.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AssignAllowanceToEmployeeRequestBodyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AssignAllowanceToEmployeeRequestBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignAllowanceToEmployeeResponse {
  const AssignAllowanceToEmployeeResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors = const <AllowanceValidationError>[],
  });

  final AssignedEmployeeAllowanceData? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<AllowanceValidationError> validationErrors;

  factory AssignAllowanceToEmployeeResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AssignAllowanceToEmployeeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AssignAllowanceToEmployeeResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedEmployeeAllowanceData {
  const AssignedEmployeeAllowanceData({
    this.id,
    this.allowanceId,
    this.allowanceName,
    this.allowanceTypeName,
    this.amount,
    this.allowancePeriod,
    this.beneficiaryData,
    this.beneficiaryAllowanceStatus,
  });

  final String? id;
  final String? allowanceId;
  final String? allowanceName;
  final String? allowanceTypeName;
  final num? amount;
  final AllowancePeriod? allowancePeriod;
  final AllowanceBeneficiaryData? beneficiaryData;
  final int? beneficiaryAllowanceStatus;

  factory AssignedEmployeeAllowanceData.fromJson(Map<String, dynamic> json) =>
      _$AssignedEmployeeAllowanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedEmployeeAllowanceDataToJson(this);
}
