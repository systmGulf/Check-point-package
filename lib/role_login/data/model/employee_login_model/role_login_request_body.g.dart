// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleLoginRequestBody _$RoleLoginRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RoleLoginRequestBody(
      emailOrPhone: json['emailOrPhone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RoleLoginRequestBodyToJson(
        RoleLoginRequestBody instance) =>
    <String, dynamic>{
      'emailOrPhone': instance.emailOrPhone,
      'password': instance.password,
    };
