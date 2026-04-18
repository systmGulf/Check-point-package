// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEventResponse _$CompanyEventResponseFromJson(
        Map<String, dynamic> json) =>
    CompanyEventResponse(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => CompanyEventItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$CompanyEventResponseToJson(
        CompanyEventResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

CompanyEventItem _$CompanyEventItemFromJson(Map<String, dynamic> json) =>
    CompanyEventItem(
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      startAt: json['startAt'] as String?,
      endAt: json['endAt'] as String?,
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      isPublished: json['isPublished'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CompanyEventItemToJson(CompanyEventItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'isPublished': instance.isPublished,
      'id': instance.id,
    };
