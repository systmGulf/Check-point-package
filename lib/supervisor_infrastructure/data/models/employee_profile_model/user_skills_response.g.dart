// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skills_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSkillsResponse _$UserSkillsResponseFromJson(Map<String, dynamic> json) =>
    UserSkillsResponse(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => UserSkillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserSkillsResponseToJson(UserSkillsResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

UserSkillItem _$UserSkillItemFromJson(Map<String, dynamic> json) =>
    UserSkillItem(
      employeeId: json['employeeId'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      skillId: json['skillId'] as String?,
      skillName: json['skillName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserSkillItemToJson(UserSkillItem instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'rate': instance.rate,
      'skillId': instance.skillId,
      'skillName': instance.skillName,
      'id': instance.id,
    };
