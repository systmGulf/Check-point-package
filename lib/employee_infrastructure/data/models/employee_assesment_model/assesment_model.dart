import 'package:json_annotation/json_annotation.dart';

part 'assesment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EmployeeAssessmentModel {
  final String? id;
  final String? employeeId;
  final String? assessmentId;
  final AssesmentModel? assessment;

  EmployeeAssessmentModel({
    required this.id,
    required this.employeeId,
    required this.assessmentId,
    required this.assessment,
  });

  factory EmployeeAssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAssessmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeAssessmentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssesmentModel {
  final String? id;
  final String? title;
  final String? description;
  final int? minutes;
  final List<QuestionModel>? questions;
  final DateTime? createdDate;

  AssesmentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.minutes,
    required this.questions,
    required this.createdDate,
  });

  factory AssesmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssesmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssesmentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  final String? text;
  final int? grade;
  final List<OptionModel>? options;

  QuestionModel({
    required this.text,
    required this.grade,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable()
class OptionModel {
  final String? text;
  final bool? isCorrect;

  OptionModel({
    required this.text,
    required this.isCorrect,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
