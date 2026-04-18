import 'package:freezed_annotation/freezed_annotation.dart';

part 'supervisor_news_response.g.dart';

@JsonSerializable()
class AnnouncementResponse {
  List<AnnouncementItem>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  AnnouncementResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory AnnouncementResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementResponseFromJson(json);
}

@JsonSerializable()
class AnnouncementItem {
  String? title;
  String? body;
  String? publishAt;
  String? expireAt;
  String? employeeId;
  String? employeeName;
  bool? isPublished;
  String? id;

  AnnouncementItem({
    this.title,
    this.body,
    this.publishAt,
    this.expireAt,
    this.employeeId,
    this.employeeName,
    this.isPublished,
    this.id,
  });

  factory AnnouncementItem.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementItemFromJson(json);
}
