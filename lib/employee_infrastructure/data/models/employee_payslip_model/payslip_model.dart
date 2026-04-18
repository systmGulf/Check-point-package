import 'package:json_annotation/json_annotation.dart';

part 'payslip_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayrollModel {
  final String id;
  final double netSalary;
  final Analysis analysis;
  final PayrollProfile payrollProfile;

  PayrollModel({
    required this.id,
    required this.netSalary,
    required this.analysis,
    required this.payrollProfile,
  });

  factory PayrollModel.fromJson(Map<String, dynamic> json) =>
      _$PayrollModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayrollModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Analysis {
  final double totalAdditions;
  final double totalDeductions;
  final InsuranceAnalysis insuranceAnalysis;

  Analysis({
    required this.totalAdditions,
    required this.totalDeductions,
    required this.insuranceAnalysis,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisToJson(this);
}
@JsonSerializable()
class InsuranceAnalysis {
  final double socialInsurance;
  final double medicalInsurance;

  InsuranceAnalysis({
    required this.socialInsurance,
    required this.medicalInsurance,
  });

  factory InsuranceAnalysis.fromJson(Map<String, dynamic> json) =>
      _$InsuranceAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceAnalysisToJson(this);
}
@JsonSerializable()
class Owner {
  final String id;
  final String name;

  Owner({
    required this.id,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) =>
      _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
@JsonSerializable()
class Period {
  final int month;
  final int year;

  Period({
    required this.month,
    required this.year,
  });

  factory Period.fromJson(Map<String, dynamic> json) =>
      _$PeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);
}
@JsonSerializable()
class Component {
  final String name;
  final double amount;
  final int category;
  final int type;
  final Map<String, dynamic> metadata;

  Component({
    required this.name,
    required this.amount,
    required this.category,
    required this.type,
    required this.metadata,
  });

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}
@JsonSerializable(explicitToJson: true)
class PayrollProfile {
  final String id;
  final Owner owner;
  final double grossSalary;
  final Period period;
  final bool isCalculated;
  final List<Component> components;

  PayrollProfile({
    required this.id,
    required this.owner,
    required this.grossSalary,
    required this.period,
    required this.isCalculated,
    required this.components,
  });

  factory PayrollProfile.fromJson(Map<String, dynamic> json) =>
      _$PayrollProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PayrollProfileToJson(this);
}