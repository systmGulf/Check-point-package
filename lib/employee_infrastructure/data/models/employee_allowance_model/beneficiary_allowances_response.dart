class BeneficiaryAllowancesResponse {
  BeneficiaryAllowancesResponse({
    this.value = const <BeneficiaryAllowanceItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<BeneficiaryAllowanceItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory BeneficiaryAllowancesResponse.fromJson(Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? <dynamic>[];

    return BeneficiaryAllowancesResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(BeneficiaryAllowanceItem.fromJson)
          .toList(),
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );
  }
}

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

  factory BeneficiaryAllowanceItem.fromJson(Map<String, dynamic> json) {
    return BeneficiaryAllowanceItem(
      allowanceId: json['allowanceId'] as String?,
      allowanceName: json['allowanceName'] as String?,
      allowanceTypeName: json['allowanceTypeName'] as String?,
      amount: json['amount'] as num?,
      allowancePeriod: json['allowancePeriod'] is Map<String, dynamic>
          ? AllowancePeriod.fromJson(
              json['allowancePeriod'] as Map<String, dynamic>,
            )
          : null,
      beneficiaryData: json['beneficiaryData'] is Map<String, dynamic>
          ? AllowanceBeneficiaryData.fromJson(
              json['beneficiaryData'] as Map<String, dynamic>,
            )
          : null,
      beneficiaryAllowanceStatus: json['beneficiaryAllowanceStatus'] as int?,
      id: json['id'] as String?,
    );
  }
}

class AllowancePeriod {
  AllowancePeriod({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory AllowancePeriod.fromJson(Map<String, dynamic> json) {
    return AllowancePeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class AllowanceBeneficiaryData {
  AllowanceBeneficiaryData({
    this.beneficiaryId,
    this.beneficiaryName,
  });

  final String? beneficiaryId;
  final String? beneficiaryName;

  factory AllowanceBeneficiaryData.fromJson(Map<String, dynamic> json) {
    return AllowanceBeneficiaryData(
      beneficiaryId: (json['beneficaryId'] as String?) ??
          (json['beneficiaryId'] as String?),
      beneficiaryName: (json['beneficaryName'] as String?) ??
          (json['beneficiaryName'] as String?),
    );
  }
}

class AllowanceRequestResponse {
  AllowanceRequestResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final dynamic value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory AllowanceRequestResponse.fromJson(Map<String, dynamic> json) {
    return AllowanceRequestResponse(
      value: json['value'],
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );
  }
}
