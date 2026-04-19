class InstallementTypesResponse {
  InstallementTypesResponse({
    this.value = const <InstallementTypeItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<InstallementTypeItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory InstallementTypesResponse.fromJson(Map<String, dynamic> json) {
    final rawValue = json['value'] as List<dynamic>? ?? <dynamic>[];

    return InstallementTypesResponse(
      value: rawValue
          .whereType<Map<String, dynamic>>()
          .map(InstallementTypeItem.fromJson)
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

class InstallementTypeItem {
  InstallementTypeItem({
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
  final num? percentage;

  factory InstallementTypeItem.fromJson(Map<String, dynamic> json) {
    return InstallementTypeItem(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      percentage: json['percentage'] as num?,
    );
  }
}
