import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_news_response.g.dart';

@JsonSerializable()
class UserNewsResponse {
  List<UserNewsItem>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  UserNewsResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory UserNewsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserNewsResponseFromJson(json);
}

@JsonSerializable()
class UserNewsItem {
  String? title;
  String? summary;
  String? content;
  String? publishedAt;
  bool? isPublished;
  String? id;

  UserNewsItem({
    this.title,
    this.summary,
    this.content,
    this.publishedAt,
    this.isPublished,
    this.id,
  });

  factory UserNewsItem.fromJson(Map<String, dynamic> json) =>
      _$UserNewsItemFromJson(json);
}
