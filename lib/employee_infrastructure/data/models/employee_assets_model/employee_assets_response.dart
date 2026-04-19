class EmployeeAssetsResponse {
  EmployeeAssetsResponse({
    required this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<EmployeeAssetItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory EmployeeAssetsResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeAssetsResponse(
      value: (json['value'] as List<dynamic>? ?? <dynamic>[])
          .map((e) => EmployeeAssetItem.fromJson(e as Map<String, dynamic>))
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

class EmployeeAssetItem {
  EmployeeAssetItem({
    this.id,
    this.name,
    this.description,
    this.serialNumber,
    this.category,
    this.status,
    this.purchaseDate,
    this.purchasePrice,
    this.notes,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? serialNumber;
  final String? category;
  final int? status;
  final String? purchaseDate;
  final num? purchasePrice;
  final String? notes;

  factory EmployeeAssetItem.fromJson(Map<String, dynamic> json) {
    return EmployeeAssetItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      serialNumber: json['serialNumber'] as String?,
      category: json['category'] as String?,
      status: json['status'] as int?,
      purchaseDate: json['purchaseDate'] as String?,
      purchasePrice: json['purchasePrice'] as num?,
      notes: json['notes'] as String?,
    );
  }
}
