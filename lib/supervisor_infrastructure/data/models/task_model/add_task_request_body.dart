import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_request_body.g.dart';

@JsonSerializable()
class AddTaskRequestBody {
  final String title;
  final String description;

  AddTaskRequestBody({
    required this.title,
    required this.description,
  });

  factory AddTaskRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddTaskRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestBodyToJson(this);
}
