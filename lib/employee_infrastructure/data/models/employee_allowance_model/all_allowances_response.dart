import 'package:freezed_annotation/freezed_annotation.dart';

import 'beneficiary_allowances_response.dart';

part 'all_allowances_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AllAllowancesResponse {
  const AllAllowancesResponse({
    this.value = const <AllowanceCatalogItem>[],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors = const <AllowanceValidationError>[],
  });

  final List<AllowanceCatalogItem> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<AllowanceValidationError> validationErrors;

  factory AllAllowancesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllAllowancesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllAllowancesResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllowanceCatalogItem {
  const AllowanceCatalogItem({
    this.code,
    this.name,
    this.description,
    this.allowanceTypeId,
    this.allowancePeriod,
    this.amount,
    this.allowanceStatus,
    this.id,
  });

  final String? code;
  final String? name;
  final String? description;
  final String? allowanceTypeId;
  final AllowancePeriod? allowancePeriod;
  final num? amount;
  final int? allowanceStatus;
  final String? id;

  factory AllowanceCatalogItem.fromJson(Map<String, dynamic> json) =>
      _$AllowanceCatalogItemFromJson(json);

  Map<String, dynamic> toJson() => _$AllowanceCatalogItemToJson(this);
}
