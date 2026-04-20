class CreateLoanRequestBody {
  CreateLoanRequestBody({
    required this.requesterId,
    required this.installementTypeId,
    required this.period,
    required this.amount,
  });

  final String requesterId;
  final String installementTypeId;
  final LoanPeriodBody period;
  final num amount;

  Map<String, dynamic> toJson() {
    return {
      'requesterId': requesterId,
      'installementTypeId': installementTypeId,
      'period': period.toJson(),
      'amount': amount,
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