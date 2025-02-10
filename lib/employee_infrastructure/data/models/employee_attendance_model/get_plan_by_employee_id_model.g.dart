// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_by_employee_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlanByEmployeeIdModel _$GetPlanByEmployeeIdModelFromJson(
        Map<String, dynamic> json) =>
    GetPlanByEmployeeIdModel(
      value: json['value'] == null
          ? null
          : GetPlanByEmployeeIdValue.fromJson(
              json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$GetPlanByEmployeeIdModelToJson(
        GetPlanByEmployeeIdModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

GetPlanByEmployeeIdValue _$GetPlanByEmployeeIdValueFromJson(
        Map<String, dynamic> json) =>
    GetPlanByEmployeeIdValue(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetPlanByEmployeeIdData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetPlanByEmployeeIdValueToJson(
        GetPlanByEmployeeIdValue instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'start': instance.start,
      'end': instance.end,
    };

GetPlanByEmployeeIdData _$GetPlanByEmployeeIdDataFromJson(
        Map<String, dynamic> json) =>
    GetPlanByEmployeeIdData(
      id: (json['id'] as num?)?.toInt(),
      planDate: json['planDate'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$GetPlanByEmployeeIdDataToJson(
        GetPlanByEmployeeIdData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planDate': instance.planDate,
      'note': instance.note,
    };
