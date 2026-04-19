class EmployeeAssetRequestsResponse {
  EmployeeAssetRequestsResponse({
    required this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<EmployeeAssetRequestItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory EmployeeAssetRequestsResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeAssetRequestsResponse(
      value: (json['value'] as List<dynamic>? ?? <dynamic>[])
          .map(
            (e) => EmployeeAssetRequestItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
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

class EmployeeAssetRequestResponse {
  EmployeeAssetRequestResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final EmployeeAssetRequestItem? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory EmployeeAssetRequestResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeAssetRequestResponse(
      value: json['value'] == null
          ? null
          : EmployeeAssetRequestItem.fromJson(
              json['value'] as Map<String, dynamic>,
            ),
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );
  }
}

class EmployeeAssetRequestItem {
  EmployeeAssetRequestItem({
    this.id,
    this.employeeId,
    this.assetId,
    this.assetName,
    this.status,
    this.requestedAt,
    this.approvedAt,
    this.returnedAt,
    this.requestNotes,
  });

  final String? id;
  final String? employeeId;
  final String? assetId;
  final String? assetName;
  final int? status;
  final String? requestedAt;
  final String? approvedAt;
  final String? returnedAt;
  final String? requestNotes;

  factory EmployeeAssetRequestItem.fromJson(Map<String, dynamic> json) {
    return EmployeeAssetRequestItem(
      id: json['id'] as String?,
      employeeId: json['employeeId'] as String?,
      assetId: json['assetId'] as String?,
      assetName: json['assetName'] as String?,
      status: json['status'] as int?,
      requestedAt: json['requestedAt'] as String?,
      approvedAt: json['approvedAt'] as String?,
      returnedAt: json['returnedAt'] as String?,
      requestNotes: json['requestNotes'] as String?,
    );
  }
}
