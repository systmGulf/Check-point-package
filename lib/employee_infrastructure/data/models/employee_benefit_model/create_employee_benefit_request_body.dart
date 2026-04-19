class CreateEmployeeBenefitRequestBody {
  CreateEmployeeBenefitRequestBody({
    required this.benefitId,
    required this.benefitName,
    required this.benefitPlanName,
    required this.benefitElements,
    required this.period,
    required this.status,
    required this.beneficiaryData,
    required this.beneficiaryId,
    required this.dependants,
    required this.name,
    required this.startDate,
    required this.endDate,
  });

  final String benefitId;
  final String benefitName;
  final String benefitPlanName;
  final List<BenefitElementBody> benefitElements;
  final BenefitPeriodBody period;
  final int status;
  final BeneficiaryDataBody beneficiaryData;
  final String beneficiaryId;
  final List<DependantBody> dependants;
  final String name;
  final String startDate;
  final String endDate;

  Map<String, dynamic> toJson() {
    return {
      'benefitId': benefitId,
      'benefitName': benefitName,
      'benefitPlanName': benefitPlanName,
      'benefitElements': benefitElements.map((e) => e.toJson()).toList(),
      'period': period.toJson(),
      'status': status,
      'beneficiaryData': beneficiaryData.toJson(),
      'beneficiaryId': beneficiaryId,
      'dependants': dependants.map((e) => e.toJson()).toList(),
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}

class BenefitElementBody {
  BenefitElementBody({
    required this.name,
    required this.description,
    required this.amount,
  });

  final String name;
  final String description;
  final num amount;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'amount': amount,
    };
  }
}

class BenefitPeriodBody {
  BenefitPeriodBody({
    required this.startDate,
    required this.endDate,
  });

  final String startDate;
  final String endDate;

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}

class BeneficiaryDataBody {
  BeneficiaryDataBody({
    required this.beneficiaryId,
    required this.name,
    required this.dependents,
  });

  final String beneficiaryId;
  final String name;
  final List<String> dependents;

  Map<String, dynamic> toJson() {
    return {
      'beneficiaryId': beneficiaryId,
      'name': name,
      'dependents': dependents,
    };
  }
}

class DependantBody {
  DependantBody({
    required this.beneficiaryId,
    required this.name,
    required this.dependents,
  });

  final String beneficiaryId;
  final String name;
  final List<String> dependents;

  Map<String, dynamic> toJson() {
    return {
      'beneficiaryId': beneficiaryId,
      'name': name,
      'dependents': dependents,
    };
  }
}
