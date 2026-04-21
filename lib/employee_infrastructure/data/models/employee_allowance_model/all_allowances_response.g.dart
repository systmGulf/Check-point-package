// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_allowances_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAllowancesResponse _$AllAllowancesResponseFromJson(
        Map<String, dynamic> json) =>
    AllAllowancesResponse(
      value: (json['value'] as List<dynamic>?)
              ?.map((e) =>
                  AllowanceCatalogItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AllowanceCatalogItem>[],
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: (json['validationErrors'] as List<dynamic>?)
              ?.map((e) =>
                  AllowanceValidationError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AllowanceValidationError>[],
    );

Map<String, dynamic> _$AllAllowancesResponseToJson(
        AllAllowancesResponse instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors':
          instance.validationErrors.map((e) => e.toJson()).toList(),
    };

AllowanceCatalogItem _$AllowanceCatalogItemFromJson(
        Map<String, dynamic> json) =>
    AllowanceCatalogItem(
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      allowanceTypeId: json['allowanceTypeId'] as String?,
      allowancePeriod: json['allowancePeriod'] == null
          ? null
          : AllowancePeriod.fromJson(
              json['allowancePeriod'] as Map<String, dynamic>),
      amount: json['amount'] as num?,
      allowanceStatus: (json['allowanceStatus'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AllowanceCatalogItemToJson(
        AllowanceCatalogItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'allowanceTypeId': instance.allowanceTypeId,
      'allowancePeriod': instance.allowancePeriod?.toJson(),
      'amount': instance.amount,
      'allowanceStatus': instance.allowanceStatus,
      'id': instance.id,
    };
