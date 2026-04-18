// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNewsResponse _$UserNewsResponseFromJson(Map<String, dynamic> json) =>
    UserNewsResponse(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => UserNewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserNewsResponseToJson(UserNewsResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

UserNewsItem _$UserNewsItemFromJson(Map<String, dynamic> json) => UserNewsItem(
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
      publishedAt: json['publishedAt'] as String?,
      isPublished: json['isPublished'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserNewsItemToJson(UserNewsItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
      'isPublished': instance.isPublished,
      'id': instance.id,
    };
