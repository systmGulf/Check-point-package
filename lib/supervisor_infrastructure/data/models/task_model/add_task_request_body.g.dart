// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_request_body.dart';

// ***************************************************************************
// JsonSerializableGenerator
// ***************************************************************************

AddTaskRequestBody _$AddTaskRequestBodyFromJson(Map<String, dynamic> json) =>
    AddTaskRequestBody(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AddTaskRequestBodyToJson(AddTaskRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
