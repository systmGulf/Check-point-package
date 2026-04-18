// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisor_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementResponse _$AnnouncementResponseFromJson(
        Map<String, dynamic> json) =>
    AnnouncementResponse(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => AnnouncementItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$AnnouncementResponseToJson(
        AnnouncementResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

AnnouncementItem _$AnnouncementItemFromJson(Map<String, dynamic> json) =>
    AnnouncementItem(
      title: json['title'] as String?,
      body: json['body'] as String?,
      publishAt: json['publishAt'] as String?,
      expireAt: json['expireAt'] as String?,
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      isPublished: json['isPublished'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AnnouncementItemToJson(AnnouncementItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'publishAt': instance.publishAt,
      'expireAt': instance.expireAt,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'isPublished': instance.isPublished,
      'id': instance.id,
    };
