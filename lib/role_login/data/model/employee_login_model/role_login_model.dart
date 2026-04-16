import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_login_model.g.dart';

@JsonSerializable()
class RoleLoginModel extends Equatable {
  final RoleLoginResponseValue? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<String>? errors;
  final List<RoleLoginValidationError>? validationErrors;

  const RoleLoginModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory RoleLoginModel.fromJson(Map<String, dynamic> json) =>
      _$RoleLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleLoginModelToJson(this);

  @override
  List<Object?> get props => [
        value,
        status,
        isSuccess,
        successMessage,
        correlationId,
        errors,
        validationErrors,
      ];
}

@JsonSerializable()
class RoleLoginResponseValue extends Equatable {
  final LoginResponseDto? loginResponseDto;
  final String? employeeId;
  final String? employeeName;
  final String? employeeCode;

  const RoleLoginResponseValue({
    this.loginResponseDto,
    this.employeeId,
    this.employeeName,
    this.employeeCode,
  });

  factory RoleLoginResponseValue.fromJson(Map<String, dynamic> json) =>
      _$RoleLoginResponseValueFromJson(json);

  Map<String, dynamic> toJson() => _$RoleLoginResponseValueToJson(this);

  @override
  List<Object?> get props => [
        loginResponseDto,
        employeeId,
        employeeName,
        employeeCode,
      ];
}

@JsonSerializable()
class LoginResponseDto extends Equatable {
  final String? userId;
  final String? userName;
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final List<String>? roles;
  final String? token;

  const LoginResponseDto({
    this.userId,
    this.userName,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.roles,
    this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        userId,
        userName,
        email,
        fullName,
        phoneNumber,
        firstName,
        lastName,
        roles,
        token,
      ];
}

@JsonSerializable()
class RoleLoginValidationError extends Equatable {
  final String? identifier;
  final String? errorMessage;
  final String? errorCode;
  final int? severity;

  const RoleLoginValidationError({
    this.identifier,
    this.errorMessage,
    this.errorCode,
    this.severity,
  });

  factory RoleLoginValidationError.fromJson(Map<String, dynamic> json) =>
      _$RoleLoginValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$RoleLoginValidationErrorToJson(this);

  @override
  List<Object?> get props => [identifier, errorMessage, errorCode, severity];
}
