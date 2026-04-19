class RequestAssetRequestBody {
  RequestAssetRequestBody({
    required this.employeeId,
    required this.assetId,
    required this.requestNotes,
  });

  final String employeeId;
  final String assetId;
  final String requestNotes;

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'assetId': assetId,
      'requestNotes': requestNotes,
    };
  }
}
