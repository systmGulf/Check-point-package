// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_allowances_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeneficiaryAllowancesResponse _$BeneficiaryAllowancesResponseFromJson(
        Map<String, dynamic> json) =>
    BeneficiaryAllowancesResponse(
      value: (json['value'] as List<dynamic>?)
              ?.map((e) =>
                  BeneficiaryAllowanceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BeneficiaryAllowanceItem>[],
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

Map<String, dynamic> _$BeneficiaryAllowancesResponseToJson(
        BeneficiaryAllowancesResponse instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors':
          instance.validationErrors.map((e) => e.toJson()).toList(),
    };

BeneficiaryAllowanceItem _$BeneficiaryAllowanceItemFromJson(
        Map<String, dynamic> json) =>
    BeneficiaryAllowanceItem(
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
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BeneficiaryAllowanceItemToJson(
        BeneficiaryAllowanceItem instance) =>
    <String, dynamic>{
      'allowanceId': instance.allowanceId,
      'allowanceName': instance.allowanceName,
      'allowanceTypeName': instance.allowanceTypeName,
      'amount': instance.amount,
      'allowancePeriod': instance.allowancePeriod?.toJson(),
      'beneficiaryData': instance.beneficiaryData?.toJson(),
      'beneficiaryAllowanceStatus': instance.beneficiaryAllowanceStatus,
      'id': instance.id,
    };

AllowancePeriod _$AllowancePeriodFromJson(Map<String, dynamic> json) =>
    AllowancePeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$AllowancePeriodToJson(AllowancePeriod instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

AllowanceBeneficiaryData _$AllowanceBeneficiaryDataFromJson(
        Map<String, dynamic> json) =>
    AllowanceBeneficiaryData(
      beneficiaryId:
          AllowanceBeneficiaryData._readBeneficiaryId(json, 'beneficiaryId')
              as String?,
      beneficiaryName:
          AllowanceBeneficiaryData._readBeneficiaryName(json, 'beneficiaryName')
              as String?,
    );

Map<String, dynamic> _$AllowanceBeneficiaryDataToJson(
        AllowanceBeneficiaryData instance) =>
    <String, dynamic>{
      'beneficiaryId': instance.beneficiaryId,
      'beneficiaryName': instance.beneficiaryName,
    };

AllowanceRequestResponse _$AllowanceRequestResponseFromJson(
        Map<String, dynamic> json) =>
    AllowanceRequestResponse(
      value: json['value'],
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

Map<String, dynamic> _$AllowanceRequestResponseToJson(
        AllowanceRequestResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors':
          instance.validationErrors.map((e) => e.toJson()).toList(),
    };

AllowanceValidationError _$AllowanceValidationErrorFromJson(
        Map<String, dynamic> json) =>
    AllowanceValidationError(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: (json['severity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllowanceValidationErrorToJson(
        AllowanceValidationError instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'severity': instance.severity,
    };
