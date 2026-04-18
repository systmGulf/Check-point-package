import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  final List<FeedbackItem>? value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  FeedbackModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}

@JsonSerializable()
class FeedbackItem {
  final String? employeeId;
  final String? employeeName;
  final String? subject;
  final String? message;
  final int? rating;
  final bool? isReviewed;
  final String? id;

  FeedbackItem({
    this.employeeId,
    this.employeeName,
    this.subject,
    this.message,
    this.rating,
    this.isReviewed,
    this.id,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) =>
      _$FeedbackItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackItemToJson(this);
}