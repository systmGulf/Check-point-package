class SkillCatalogResponse {
  SkillCatalogResponse({
    required this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  final List<SkillCatalogItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  factory SkillCatalogResponse.fromJson(Map<String, dynamic> json) {
    return SkillCatalogResponse(
      value: (json['value'] as List<dynamic>? ?? <dynamic>[])
          .map((e) => SkillCatalogItem.fromJson(e as Map<String, dynamic>))
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

class SkillCatalogItem {
  SkillCatalogItem({
    this.name,
    this.description,
    this.sku,
    this.id,
  });

  final String? name;
  final String? description;
  final String? sku;
  final String? id;

  factory SkillCatalogItem.fromJson(Map<String, dynamic> json) {
    return SkillCatalogItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      sku: json['sku'] as String?,
      id: json['id'] as String?,
    );
  }
}
