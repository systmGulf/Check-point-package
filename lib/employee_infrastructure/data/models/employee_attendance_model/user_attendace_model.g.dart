// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_attendace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAttendanceModel _$UserAttendanceModelFromJson(Map<String, dynamic> json) =>
    UserAttendanceModel(
      value: json['value'] == null
          ? null
          : UserAttendanceValue.fromJson(json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserAttendanceModelToJson(
        UserAttendanceModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

UserAttendanceValue _$UserAttendanceValueFromJson(Map<String, dynamic> json) =>
    UserAttendanceValue(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserAttendanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      date: json['date'] as String?,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
    );

Map<String, dynamic> _$UserAttendanceValueToJson(
        UserAttendanceValue instance) =>
    <String, dynamic>{
      'data': instance.data,
      'id': instance.id,
      'date': instance.date,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
    };

UserAttendanceData _$UserAttendanceDataFromJson(Map<String, dynamic> json) =>
    UserAttendanceData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      publishAt: json['publishAt'] == null
          ? null
          : DateTime.parse(json['publishAt'] as String),
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      isPublished: json['isPublished'] as bool?,
    );

Map<String, dynamic> _$UserAttendanceDataToJson(UserAttendanceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'publishAt': instance.publishAt?.toIso8601String(),
      'expireAt': instance.expireAt?.toIso8601String(),
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'isPublished': instance.isPublished,
    };
