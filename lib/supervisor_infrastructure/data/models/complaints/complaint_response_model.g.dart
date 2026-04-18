// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintResponseModel _$ComplaintResponseModelFromJson(
        Map<String, dynamic> json) =>
    ComplaintResponseModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => ComplaintItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) =>
              ComplaintValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplaintResponseModelToJson(
        ComplaintResponseModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

ComplaintItem _$ComplaintItemFromJson(Map<String, dynamic> json) =>
    ComplaintItem(
      id: json['id'] as String?,
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      status: (json['status'] as num?)?.toInt(),
      resolutionNote: json['resolutionNote'] as String?,
    );

Map<String, dynamic> _$ComplaintItemToJson(ComplaintItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'subject': instance.subject,
      'description': instance.description,
      'status': instance.status,
      'resolutionNote': instance.resolutionNote,
    };

ComplaintValidationError _$ComplaintValidationErrorFromJson(
        Map<String, dynamic> json) =>
    ComplaintValidationError(
      identifier: json['identifier'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      severity: (json['severity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ComplaintValidationErrorToJson(
        ComplaintValidationError instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'severity': instance.severity,
    };
