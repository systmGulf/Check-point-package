class CreateLoanRequestResponse {
  CreateLoanRequestResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final LoanRequestValue? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<LoanValidationErrorItem>? validationErrors;

  factory CreateLoanRequestResponse.fromJson(Map<String, dynamic> json) {
    return CreateLoanRequestResponse(
      value: json['value'] is Map<String, dynamic>
          ? LoanRequestValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: (json['validationErrors'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(LoanValidationErrorItem.fromJson)
          .toList(),
    );
  }
}

class LoanRequestValue {
  LoanRequestValue({
    this.id,
    this.code,
    this.installementsType,
    this.amount,
    this.period,
    this.status,
    this.loanRequester,
  });

  final String? id;
  final String? code;
  final LoanInstallementsType? installementsType;
  final num? amount;
  final LoanRequestPeriod? period;
  final int? status;
  final LoanRequesterInfo? loanRequester;

  factory LoanRequestValue.fromJson(Map<String, dynamic> json) {
    return LoanRequestValue(
      id: json['id'] as String?,
      code: json['code'] as String?,
      installementsType: json['installementsType'] is Map<String, dynamic>
          ? LoanInstallementsType.fromJson(
              json['installementsType'] as Map<String, dynamic>,
            )
          : null,
      amount: json['amount'] as num?,
      period: json['period'] is Map<String, dynamic>
          ? LoanRequestPeriod.fromJson(json['period'] as Map<String, dynamic>)
          : null,
      status: json['status'] as int?,
      loanRequester: json['loanRequester'] is Map<String, dynamic>
          ? LoanRequesterInfo.fromJson(
              json['loanRequester'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class LoanInstallementsType {
  LoanInstallementsType({
    this.id,
    this.createdBy,
    this.modifiedBy,
    this.createdDate,
    this.updatedDate,
    this.code,
    this.name,
    this.description,
    this.percentage,
  });

  final String? id;
  final String? createdBy;
  final String? modifiedBy;
  final String? createdDate;
  final String? updatedDate;
  final String? code;
  final String? name;
  final String? description;
  final num? percentage;

  factory LoanInstallementsType.fromJson(Map<String, dynamic> json) {
    return LoanInstallementsType(
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      percentage: json['percentage'] as num?,
    );
  }
}

class LoanRequestPeriod {
  LoanRequestPeriod({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory LoanRequestPeriod.fromJson(Map<String, dynamic> json) {
    return LoanRequestPeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class LoanRequesterInfo {
  LoanRequesterInfo({
    this.requesterId,
    this.requesterName,
  });

  final String? requesterId;
  final String? requesterName;

  factory LoanRequesterInfo.fromJson(Map<String, dynamic> json) {
    return LoanRequesterInfo(
      requesterId: json['requesterId'] as String?,
      requesterName: json['requesterName'] as String?,
    );
  }
}

class LoanValidationErrorItem {
  LoanValidationErrorItem({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  factory LoanValidationErrorItem.fromJson(Map<String, dynamic> json) {
    return LoanValidationErrorItem(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: json['severity'] as int?,
    );
  }
}
