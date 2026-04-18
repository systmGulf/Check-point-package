import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_event_response.g.dart';

@JsonSerializable()
class CompanyEventResponse {
  List<CompanyEventItem>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  CompanyEventResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory CompanyEventResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyEventResponseFromJson(json);
}

@JsonSerializable()
class CompanyEventItem {
  String? title;
  String? description;
  String? location;
  String? startAt;
  String? endAt;
  String? employeeId;
  String? employeeName;
  bool? isPublished;
  String? id;

  CompanyEventItem({
    this.title,
    this.description,
    this.location,
    this.startAt,
    this.endAt,
    this.employeeId,
    this.employeeName,
    this.isPublished,
    this.id,
  });

  factory CompanyEventItem.fromJson(Map<String, dynamic> json) =>
      _$CompanyEventItemFromJson(json);
}
