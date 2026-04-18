class EmployeeBeneficiaryBenefitsResponse {
  final List<EmployeeBeneficiaryBenefitItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  const EmployeeBeneficiaryBenefitsResponse({
    this.value = const [],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory EmployeeBeneficiaryBenefitsResponse.fromJson(
      Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? const [];
    return EmployeeBeneficiaryBenefitsResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(EmployeeBeneficiaryBenefitItem.fromJson)
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

class EmployeeBeneficiaryBenefitItem {
  final String? benefitId;
  final String? benefitName;
  final String? benefitPlanName;
  final List<BenefitElementItem> benefitElements;
  final BenefitPeriod? period;
  final int? status;
  final BenefitData? benefitData;
  final String? id;

  const EmployeeBeneficiaryBenefitItem({
    this.benefitId,
    this.benefitName,
    this.benefitPlanName,
    this.benefitElements = const [],
    this.period,
    this.status,
    this.benefitData,
    this.id,
  });

  factory EmployeeBeneficiaryBenefitItem.fromJson(Map<String, dynamic> json) {
    return EmployeeBeneficiaryBenefitItem(
      benefitId: json['benefitId'] as String?,
      benefitName: json['benefitName'] as String?,
      benefitPlanName: json['benefitPlanName'] as String?,
      benefitElements: (json['benefitElements'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(BenefitElementItem.fromJson)
          .toList(),
      period: json['period'] is Map<String, dynamic>
          ? BenefitPeriod.fromJson(json['period'] as Map<String, dynamic>)
          : null,
      status: json['status'] as int?,
      benefitData: json['benefitData'] is Map<String, dynamic>
          ? BenefitData.fromJson(json['benefitData'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
    );
  }
}

class BenefitElementItem {
  final String? name;
  final String? description;
  final num? amount;

  const BenefitElementItem({
    this.name,
    this.description,
    this.amount,
  });

  factory BenefitElementItem.fromJson(Map<String, dynamic> json) {
    return BenefitElementItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as num?,
    );
  }
}

class BenefitPeriod {
  final String? startDate;
  final String? endDate;

  const BenefitPeriod({
    this.startDate,
    this.endDate,
  });

  factory BenefitPeriod.fromJson(Map<String, dynamic> json) {
    return BenefitPeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class BenefitData {
  final String? beneficiaryId;
  final String? name;
  final List<BenefitDependent> dependents;

  const BenefitData({
    this.beneficiaryId,
    this.name,
    this.dependents = const [],
  });

  factory BenefitData.fromJson(Map<String, dynamic> json) {
    return BenefitData(
      beneficiaryId: json['beneficiaryId'] as String?,
      name: json['name'] as String?,
      dependents: (json['dependents'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(BenefitDependent.fromJson)
          .toList(),
    );
  }
}

class BenefitDependent {
  final String? beneficiaryId;
  final String? name;
  final List<BenefitDependent> dependents;

  const BenefitDependent({
    this.beneficiaryId,
    this.name,
    this.dependents = const [],
  });

  factory BenefitDependent.fromJson(Map<String, dynamic> json) {
    return BenefitDependent(
      beneficiaryId: json['beneficiaryId'] as String?,
      name: json['name'] as String?,
      dependents: (json['dependents'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(BenefitDependent.fromJson)
          .toList(),
    );
  }
}
