// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayrollModel _$PayrollModelFromJson(Map<String, dynamic> json) => PayrollModel(
      id: json['id'] as String,
      netSalary: (json['netSalary'] as num).toDouble(),
      analysis: Analysis.fromJson(json['analysis'] as Map<String, dynamic>),
      payrollProfile: PayrollProfile.fromJson(
          json['payrollProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayrollModelToJson(PayrollModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'netSalary': instance.netSalary,
      'analysis': instance.analysis.toJson(),
      'payrollProfile': instance.payrollProfile.toJson(),
    };

Analysis _$AnalysisFromJson(Map<String, dynamic> json) => Analysis(
      totalAdditions: (json['totalAdditions'] as num).toDouble(),
      totalDeductions: (json['totalDeductions'] as num).toDouble(),
      insuranceAnalysis: InsuranceAnalysis.fromJson(
          json['insuranceAnalysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalysisToJson(Analysis instance) => <String, dynamic>{
      'totalAdditions': instance.totalAdditions,
      'totalDeductions': instance.totalDeductions,
      'insuranceAnalysis': instance.insuranceAnalysis.toJson(),
    };

InsuranceAnalysis _$InsuranceAnalysisFromJson(Map<String, dynamic> json) =>
    InsuranceAnalysis(
      socialInsurance: (json['socialInsurance'] as num).toDouble(),
      medicalInsurance: (json['medicalInsurance'] as num).toDouble(),
    );

Map<String, dynamic> _$InsuranceAnalysisToJson(InsuranceAnalysis instance) =>
    <String, dynamic>{
      'socialInsurance': instance.socialInsurance,
      'medicalInsurance': instance.medicalInsurance,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
    };

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: (json['category'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'category': instance.category,
      'type': instance.type,
      'metadata': instance.metadata,
    };

PayrollProfile _$PayrollProfileFromJson(Map<String, dynamic> json) =>
    PayrollProfile(
      id: json['id'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      grossSalary: (json['grossSalary'] as num).toDouble(),
      period: Period.fromJson(json['period'] as Map<String, dynamic>),
      isCalculated: json['isCalculated'] as bool,
      components: (json['components'] as List<dynamic>)
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayrollProfileToJson(PayrollProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner.toJson(),
      'grossSalary': instance.grossSalary,
      'period': instance.period.toJson(),
      'isCalculated': instance.isCalculated,
      'components': instance.components.map((e) => e.toJson()).toList(),
    };
