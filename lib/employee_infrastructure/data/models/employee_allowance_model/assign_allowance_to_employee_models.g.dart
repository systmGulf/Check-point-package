// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_allowance_to_employee_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignAllowanceToEmployeeRequestBody
    _$AssignAllowanceToEmployeeRequestBodyFromJson(Map<String, dynamic> json) =>
        AssignAllowanceToEmployeeRequestBody(
          allowanceId: json['allowanceId'] as String,
          employeeId: json['empId'] as String,
        );

Map<String, dynamic> _$AssignAllowanceToEmployeeRequestBodyToJson(
        AssignAllowanceToEmployeeRequestBody instance) =>
    <String, dynamic>{
      'allowanceId': instance.allowanceId,
      'empId': instance.employeeId,
    };

AssignAllowanceToEmployeeResponse _$AssignAllowanceToEmployeeResponseFromJson(
        Map<String, dynamic> json) =>
    AssignAllowanceToEmployeeResponse(
      value: json['value'] == null
          ? null
          : AssignedEmployeeAllowanceData.fromJson(
              json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: (json['validationErrors'] as List<dynamic>?)
              ?.map((e) =>
                  AllowanceValidationError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AllowanceValidationError>[],
    );

Map<String, dynamic> _$AssignAllowanceToEmployeeResponseToJson(
        AssignAllowanceToEmployeeResponse instance) =>
    <String, dynamic>{
      'value': instance.value?.toJson(),
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors':
          instance.validationErrors.map((e) => e.toJson()).toList(),
    };

AssignedEmployeeAllowanceData _$AssignedEmployeeAllowanceDataFromJson(
        Map<String, dynamic> json) =>
    AssignedEmployeeAllowanceData(
      id: json['id'] as String?,
      allowanceId: json['allowanceId'] as String?,
      allowanceName: json['allowanceName'] as String?,
      allowanceTypeName: json['allowanceTypeName'] as String?,
      amount: json['amount'] as num?,
      allowancePeriod: json['allowancePeriod'] == null
          ? null
          : AllowancePeriod.fromJson(
              json['allowancePeriod'] as Map<String, dynamic>),
      beneficiaryData: json['beneficiaryData'] == null
          ? null
          : AllowanceBeneficiaryData.fromJson(
              json['beneficiaryData'] as Map<String, dynamic>),
      beneficiaryAllowanceStatus:
          (json['beneficiaryAllowanceStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AssignedEmployeeAllowanceDataToJson(
        AssignedEmployeeAllowanceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allowanceId': instance.allowanceId,
      'allowanceName': instance.allowanceName,
      'allowanceTypeName': instance.allowanceTypeName,
      'amount': instance.amount,
      'allowancePeriod': instance.allowancePeriod?.toJson(),
      'beneficiaryData': instance.beneficiaryData?.toJson(),
      'beneficiaryAllowanceStatus': instance.beneficiaryAllowanceStatus,
    };
