import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiary_allowances_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BeneficiaryAllowancesResponse {
  BeneficiaryAllowancesResponse({
    this.value = const <BeneficiaryAllowanceItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors = const <AllowanceValidationError>[],
  });

  final List<BeneficiaryAllowanceItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<AllowanceValidationError> validationErrors;

  factory BeneficiaryAllowancesResponse.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryAllowancesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryAllowancesResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BeneficiaryAllowanceItem {
  BeneficiaryAllowanceItem({
    this.allowanceId,
    this.allowanceName,
    this.allowanceTypeName,
    this.amount,
    this.allowancePeriod,
    this.beneficiaryData,
    this.beneficiaryAllowanceStatus,
    this.id,
  });

  final String? allowanceId;
  final String? allowanceName;
  final String? allowanceTypeName;
  final num? amount;
  final AllowancePeriod? allowancePeriod;
  final AllowanceBeneficiaryData? beneficiaryData;
  final int? beneficiaryAllowanceStatus;
  final String? id;

  factory BeneficiaryAllowanceItem.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryAllowanceItemFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryAllowanceItemToJson(this);
}

@JsonSerializable()
class AllowancePeriod {
  AllowancePeriod({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory AllowancePeriod.fromJson(Map<String, dynamic> json) =>
      _$AllowancePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$AllowancePeriodToJson(this);
}

@JsonSerializable()
class AllowanceBeneficiaryData {
  AllowanceBeneficiaryData({
    this.beneficiaryId,
    this.beneficiaryName,
  });

  @JsonKey(readValue: _readBeneficiaryId)
  final String? beneficiaryId;
  @JsonKey(readValue: _readBeneficiaryName)
  final String? beneficiaryName;

  static Object? _readBeneficiaryId(Map json, String key) =>
      json['beneficaryId'] ?? json[key];

  static Object? _readBeneficiaryName(Map json, String key) =>
      json['beneficaryName'] ?? json[key];

  factory AllowanceBeneficiaryData.fromJson(Map<String, dynamic> json) =>
      _$AllowanceBeneficiaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllowanceBeneficiaryDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllowanceRequestResponse {
  AllowanceRequestResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors = const <AllowanceValidationError>[],
  });

  final dynamic value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<AllowanceValidationError> validationErrors;

  factory AllowanceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$AllowanceRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllowanceRequestResponseToJson(this);
}

@JsonSerializable()
class AllowanceValidationError {
  AllowanceValidationError({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  factory AllowanceValidationError.fromJson(Map<String, dynamic> json) =>
      _$AllowanceValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AllowanceValidationErrorToJson(this);
}
