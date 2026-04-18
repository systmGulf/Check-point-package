import 'package:json_annotation/json_annotation.dart';

part 'add_feedback_request_body.g.dart';

@JsonSerializable()
class AddFeedbackRequest {
  final String subject;
  final String message;
  final int rating;
  final String employeeId;

  AddFeedbackRequest({
    required this.subject,
    required this.message,
    required this.rating,
    required this.employeeId,
  });

  factory AddFeedbackRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFeedbackRequestToJson(this);
}
