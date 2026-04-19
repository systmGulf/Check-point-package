class CreateLoanRequestBody {
  CreateLoanRequestBody({
    required this.code,
    required this.installementTypeId,
    required this.amount,
    required this.period,
    required this.status,
    required this.loanRequester,
    required this.requesterId,
    required this.requesterName,
  });

  final String code;
  final String installementTypeId;
  final num amount;
  final LoanPeriodBody period;
  final int status;
  final LoanRequesterBody loanRequester;
  final String requesterId;
  final String requesterName;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'installementTypeId': installementTypeId,
      'amount': amount,
      'period': period.toJson(),
      'status': status,
      'loanRequester': loanRequester.toJson(),
      'requesterId': requesterId,
      'requesterName': requesterName,
    };
  }
}

class LoanPeriodBody {
  LoanPeriodBody({
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

class LoanRequesterBody {
  LoanRequesterBody({
    required this.requesterId,
    required this.requesterName,
  });

  final String requesterId;
  final String requesterName;

  Map<String, dynamic> toJson() {
    return {
      'requesterId': requesterId,
      'requesterName': requesterName,
    };
  }
}
