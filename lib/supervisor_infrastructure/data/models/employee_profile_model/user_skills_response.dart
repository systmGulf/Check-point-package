import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_skills_response.g.dart';

@JsonSerializable()
class UserSkillsResponse {
  List<UserSkillItem>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  UserSkillsResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory UserSkillsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSkillsResponseFromJson(json);
}

@JsonSerializable()
class UserSkillItem {
  String? employeeId;
  int? rate;
  String? skillId;
  String? skillName;
  String? id;

  UserSkillItem({
    this.employeeId,
    this.rate,
    this.skillId,
    this.skillName,
    this.id,
  });

  factory UserSkillItem.fromJson(Map<String, dynamic> json) =>
      _$UserSkillItemFromJson(json);
}
