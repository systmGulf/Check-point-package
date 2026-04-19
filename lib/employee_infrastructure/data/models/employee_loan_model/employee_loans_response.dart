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
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory EmployeeLoansResponse.fromJson(Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? <dynamic>[];

    return EmployeeLoansResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(EmployeeLoanItem.fromJson)
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

class EmployeeLoanItem {
  EmployeeLoanItem({
    this.id,
    this.code,
    this.loanRequestId,
    this.amount,
    this.loanInstallementAmount,
    this.requester,
    this.period,
  });

  final String? id;
  final String? code;
  final String? loanRequestId;
  final num? amount;
  final num? loanInstallementAmount;
  final LoanRequester? requester;
  final LoanPeriod? period;

  factory EmployeeLoanItem.fromJson(Map<String, dynamic> json) {
    return EmployeeLoanItem(
      id: json['id'] as String?,
      code: json['code'] as String?,
      loanRequestId: json['loanRequestId'] as String?,
      amount: json['amount'] as num?,
      loanInstallementAmount: json['loanInstallementAmount'] as num?,
      requester: json['requester'] is Map<String, dynamic>
          ? LoanRequester.fromJson(json['requester'] as Map<String, dynamic>)
          : null,
      period: json['period'] is Map<String, dynamic>
          ? LoanPeriod.fromJson(json['period'] as Map<String, dynamic>)
          : null,
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
