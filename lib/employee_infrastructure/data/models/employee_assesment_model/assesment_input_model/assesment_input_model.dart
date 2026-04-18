import 'package:json_annotation/json_annotation.dart';

part 'assesment_input_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AssesmentInputModel {
  final String employeeAssessmentId;
  final List<AnswerModel> answers;

  AssesmentInputModel({
    required this.employeeAssessmentId,
    required this.answers,
  });

  factory AssesmentInputModel.fromJson(Map<String, dynamic> json) =>
      _$AssesmentInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssesmentInputModelToJson(this);
}

@JsonSerializable()
class AnswerModel {
  final int questionIndex;
  final int selectedOptionIndex;

  AnswerModel({
    required this.questionIndex,
    required this.selectedOptionIndex,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
