class RequestAllowanceRequestBody {
  RequestAllowanceRequestBody({
    this.beneficiaryAllowanceId,
    this.allowanceId,
    this.employeeId,
    this.requestNotes,
    this.extra = const <String, dynamic>{},
  });

  final String? beneficiaryAllowanceId;
  final String? allowanceId;
  final String? employeeId;
  final String? requestNotes;
  final Map<String, dynamic> extra;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (beneficiaryAllowanceId != null)
        'beneficiaryAllowanceId': beneficiaryAllowanceId,
      if (allowanceId != null) 'allowanceId': allowanceId,
      if (employeeId != null) 'employeeId': employeeId,
      if (requestNotes != null) 'requestNotes': requestNotes,
      ...extra,
    };
  }
}
