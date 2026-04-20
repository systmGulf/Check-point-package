class EmployeeLoansResponse {
  EmployeeLoansResponse({
    this.value = const <EmployeeLoanItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<EmployeeLoanItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<String>? errors;
  final List<ValidationError>? validationErrors;

  factory EmployeeLoansResponse.fromJson(Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? <dynamic>[];
    final rawErrors = json['errors'] as List<dynamic>?;
    final rawValidationErrors = json['validationErrors'] as List<dynamic>?;

    return EmployeeLoansResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(EmployeeLoanItem.fromJson)
          .toList(),
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: rawErrors?.map((e) => e.toString()).toList(),
      validationErrors: rawValidationErrors
          ?.whereType<Map<String, dynamic>>()
          .map(ValidationError.fromJson)
          .toList(),
    );
  }
}

class EmployeeLoanItem {
  EmployeeLoanItem({
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
  final InstallementsType? installementsType;
  final num? amount;
  final LoanPeriod? period;
  final int? status;
  final LoanRequester? loanRequester;

  factory EmployeeLoanItem.fromJson(Map<String, dynamic> json) {
    return EmployeeLoanItem(
      id: json['id'] as String?,
      code: json['code'] as String?,
      installementsType: json['installementsType'] is Map<String, dynamic>
          ? InstallementsType.fromJson(json['installementsType'] as Map<String, dynamic>)
          : null,
      amount: json['amount'] as num?,
      period: json['period'] is Map<String, dynamic>
          ? LoanPeriod.fromJson(json['period'] as Map<String, dynamic>)
          : null,
      status: json['status'] as int?,
      loanRequester: json['loanRequester'] is Map<String, dynamic>
          ? LoanRequester.fromJson(json['loanRequester'] as Map<String, dynamic>)
          : null,
    );
  }
}

class InstallementsType {
  InstallementsType({
    this.id,
    this.code,
    this.name,
    this.description,
    this.percentage,
  });

  final String? id;
  final String? code;
  final String? name;
  final String? description;
  final int? percentage;

  factory InstallementsType.fromJson(Map<String, dynamic> json) {
    return InstallementsType(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      percentage: json['percentage'] as int?,
    );
  }
}

class LoanRequester {
  LoanRequester({
    this.requesterId,
    this.requesterName,
  });

  final String? requesterId;
  final String? requesterName;

  factory LoanRequester.fromJson(Map<String, dynamic> json) {
    return LoanRequester(
      requesterId: json['requesterId'] as String?,
      requesterName: json['requesterName'] as String?,
    );
  }
}

class LoanPeriod {
  LoanPeriod({
    this.startDate,
    this.endDate,
  });

  final String? startDate;
  final String? endDate;

  factory LoanPeriod.fromJson(Map<String, dynamic> json) {
    return LoanPeriod(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}

class ValidationError {
  ValidationError({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: json['severity'] as int?,
    );
  }
}