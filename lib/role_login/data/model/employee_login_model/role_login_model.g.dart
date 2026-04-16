// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleLoginModel _$RoleLoginModelFromJson(Map<String, dynamic> json) =>
    RoleLoginModel(
      value: json['value'] == null
          ? null
          : RoleLoginResponseValue.fromJson(
              json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) =>
              RoleLoginValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoleLoginModelToJson(RoleLoginModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

RoleLoginResponseValue _$RoleLoginResponseValueFromJson(
        Map<String, dynamic> json) =>
    RoleLoginResponseValue(
      loginResponseDto: json['loginResponseDto'] == null
          ? null
          : LoginResponseDto.fromJson(
              json['loginResponseDto'] as Map<String, dynamic>),
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      employeeCode: json['employeeCode'] as String?,
    );

Map<String, dynamic> _$RoleLoginResponseValueToJson(
        RoleLoginResponseValue instance) =>
    <String, dynamic>{
      'loginResponseDto': instance.loginResponseDto,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'employeeCode': instance.employeeCode,
    };

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'roles': instance.roles,
      'token': instance.token,
    };

RoleLoginValidationError _$RoleLoginValidationErrorFromJson(
        Map<String, dynamic> json) =>
    RoleLoginValidationError(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: (json['severity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoleLoginValidationErrorToJson(
        RoleLoginValidationError instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'severity': instance.severity,
    };
