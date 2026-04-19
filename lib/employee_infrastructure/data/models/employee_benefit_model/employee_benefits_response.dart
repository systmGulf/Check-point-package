class EmployeeBenefitsResponse {
  EmployeeBenefitsResponse({
    this.value = const <EmployeeBenefitItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<EmployeeBenefitItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory EmployeeBenefitsResponse.fromJson(Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? <dynamic>[];

    return EmployeeBenefitsResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(EmployeeBenefitItem.fromJson)
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

class EmployeeBenefitItem {
  EmployeeBenefitItem({
    this.period,
    this.name,
    this.description,
    this.code,
    this.planName,
    this.benfitTypeName,
    this.benefitPlanId,
    this.benefitPlans,
    this.paymentStatus,
    this.benefitStatus,
    this.id,
  });

  final BenefitPeriod? period;
  final String? name;
  final String? description;
  final String? code;
  final String? planName;
  final String? benfitTypeName;
  final String? benefitPlanId;
  final BenefitPlanDetails? benefitPlans;
  final int? paymentStatus;
  final int? benefitStatus;
  final String? id;

  factory EmployeeBenefitItem.fromJson(Map<String, dynamic> json) {
    return EmployeeBenefitItem(
      period: json['period'] is Map<String, dynamic>
          ? BenefitPeriod.fromJson(json['period'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      planName: json['planName'] as String?,
      benfitTypeName: json['benfitTypeName'] as String?,
      benefitPlanId: json['benefitPlanId'] as String?,
      benefitPlans: json['benefitPlans'] is Map<String, dynamic>
          ? BenefitPlanDetails.fromJson(
              json['benefitPlans'] as Map<String, dynamic>,
            )
          : null,
      paymentStatus: json['paymentStatus'] as int?,
      benefitStatus: json['benefitStatus'] as int?,
      id: json['id'] as String?,
    );
  }
}

class BenefitPeriod {
  BenefitPeriod({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory BenefitPeriod.fromJson(Map<String, dynamic> json) {
    return BenefitPeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class BenefitPlanDetails {
  BenefitPlanDetails({
    this.name,
    this.description,
    this.code,
    this.benefitType,
    this.benefitTypeId,
    this.benefitElements = const <BenefitElementItem>[],
    this.paymentStatus,
    this.benefitStatus,
    this.createdBy,
    this.modifiedBy,
    this.createdDate,
    this.updatedDate,
    this.id,
  });

  final String? name;
  final String? description;
  final String? code;
  final BenefitTypeItem? benefitType;
  final String? benefitTypeId;
  final List<BenefitElementItem> benefitElements;
  final int? paymentStatus;
  final int? benefitStatus;
  final String? createdBy;
  final String? modifiedBy;
  final String? createdDate;
  final String? updatedDate;
  final String? id;

  factory BenefitPlanDetails.fromJson(Map<String, dynamic> json) {
    final rawElements =
        json['benefitElements'] as List<dynamic>? ?? <dynamic>[];

    return BenefitPlanDetails(
      name: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      benefitType: json['benefitType'] is Map<String, dynamic>
          ? BenefitTypeItem.fromJson(
              json['benefitType'] as Map<String, dynamic>)
          : null,
      benefitTypeId: json['benefitTypeId'] as String?,
      benefitElements: rawElements
          .whereType<Map<String, dynamic>>()
          .map(BenefitElementItem.fromJson)
          .toList(),
      paymentStatus: json['paymentStatus'] as int?,
      benefitStatus: json['benefitStatus'] as int?,
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      id: json['id'] as String?,
    );
  }
}

class BenefitTypeItem {
  BenefitTypeItem({
    this.amount,
    this.name,
    this.description,
    this.code,
    this.employeePercentage,
    this.paymentStatus,
    this.id,
  });

  final num? amount;
  final String? name;
  final String? description;
  final String? code;
  final num? employeePercentage;
  final int? paymentStatus;
  final String? id;

  factory BenefitTypeItem.fromJson(Map<String, dynamic> json) {
    return BenefitTypeItem(
      amount: json['amount'] as num?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      employeePercentage: json['employeePercentage'] as num?,
      paymentStatus: json['paymentStatus'] as int?,
      id: json['id'] as String?,
    );
  }
}

class BenefitElementItem {
  BenefitElementItem({
    this.name,
    this.description,
    this.amount,
  });

  final String? name;
  final String? description;
  final num? amount;

  factory BenefitElementItem.fromJson(Map<String, dynamic> json) {
    return BenefitElementItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as num?,
    );
  }
}
