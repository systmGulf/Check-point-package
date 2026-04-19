class CreateEmployeeBenefitResponse {
  CreateEmployeeBenefitResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors = const <BenefitValidationErrorItem>[],
  });

  final EmployeeBenefitRequestValue? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<BenefitValidationErrorItem> validationErrors;

  factory CreateEmployeeBenefitResponse.fromJson(Map<String, dynamic> json) {
    return CreateEmployeeBenefitResponse(
      value: json['value'] is Map<String, dynamic>
          ? EmployeeBenefitRequestValue.fromJson(
              json['value'] as Map<String, dynamic>,
            )
          : null,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: (json['validationErrors'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(BenefitValidationErrorItem.fromJson)
          .toList(),
    );
  }
}

class EmployeeBenefitRequestValue {
  EmployeeBenefitRequestValue({
    this.id,
    this.benefitId,
    this.benefitName,
    this.benefitPlanName,
    this.benefitElements = const <BenefitElementResponseItem>[],
    this.period,
    this.status,
    this.benefitData,
  });

  final String? id;
  final String? benefitId;
  final String? benefitName;
  final String? benefitPlanName;
  final List<BenefitElementResponseItem> benefitElements;
  final BenefitPeriodResponse? period;
  final int? status;
  final BenefitDataResponse? benefitData;

  factory EmployeeBenefitRequestValue.fromJson(Map<String, dynamic> json) {
    final rawElements =
        json['benefitElements'] as List<dynamic>? ?? <dynamic>[];

    return EmployeeBenefitRequestValue(
      id: json['id'] as String?,
      benefitId: json['benefitId'] as String?,
      benefitName: json['benefitName'] as String?,
      benefitPlanName: json['benefitPlanName'] as String?,
      benefitElements: rawElements
          .whereType<Map<String, dynamic>>()
          .map(BenefitElementResponseItem.fromJson)
          .toList(),
      period: json['period'] is Map<String, dynamic>
          ? BenefitPeriodResponse.fromJson(
              json['period'] as Map<String, dynamic>)
          : null,
      status: json['status'] as int?,
      benefitData: json['benefitData'] is Map<String, dynamic>
          ? BenefitDataResponse.fromJson(
              json['benefitData'] as Map<String, dynamic>)
          : null,
    );
  }
}

class BenefitElementResponseItem {
  BenefitElementResponseItem({
    this.name,
    this.description,
    this.amount,
  });

  final String? name;
  final String? description;
  final num? amount;

  factory BenefitElementResponseItem.fromJson(Map<String, dynamic> json) {
    return BenefitElementResponseItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as num?,
    );
  }
}

class BenefitPeriodResponse {
  BenefitPeriodResponse({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory BenefitPeriodResponse.fromJson(Map<String, dynamic> json) {
    return BenefitPeriodResponse(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class BenefitDataResponse {
  BenefitDataResponse({
    this.beneficiaryId,
    this.name,
    this.dependents = const <String>[],
  });

  final String? beneficiaryId;
  final String? name;
  final List<String> dependents;

  factory BenefitDataResponse.fromJson(Map<String, dynamic> json) {
    return BenefitDataResponse(
      beneficiaryId: json['beneficiaryId'] as String?,
      name: json['name'] as String?,
      dependents: (json['dependents'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

class BenefitValidationErrorItem {
  BenefitValidationErrorItem({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  factory BenefitValidationErrorItem.fromJson(Map<String, dynamic> json) {
    return BenefitValidationErrorItem(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: json['severity'] as int?,
    );
  }
}
