import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_login_request_body.g.dart';

@JsonSerializable()
class RoleLoginRequestBody {
  @JsonKey(name: 'emailOrPhone')
  final String emailOrPhone;
  final String password;

  RoleLoginRequestBody({required this.emailOrPhone, required this.password});

  Map<String, dynamic> toJson() => _$RoleLoginRequestBodyToJson(this);
}
