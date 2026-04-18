// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeProfileResponse _$EmployeeProfileResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeProfileResponse(
      value: json['value'] == null
          ? null
          : EmployeeProfileValue.fromJson(
              json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$EmployeeProfileResponseToJson(
        EmployeeProfileResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

EmployeeProfileValue _$EmployeeProfileValueFromJson(
        Map<String, dynamic> json) =>
    EmployeeProfileValue(
      personalInfo: json['personalInfo'] == null
          ? null
          : EmployeePersonalInfo.fromJson(
              json['personalInfo'] as Map<String, dynamic>),
      contactInfo: json['contactInfo'] == null
          ? null
          : EmployeeContactInfo.fromJson(
              json['contactInfo'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      code: json['code'] as String?,
      employmentType: (json['employmentType'] as num?)?.toInt(),
      employeeSpecification: json['employeeSpecification'] == null
          ? null
          : EmployeeSpecification.fromJson(
              json['employeeSpecification'] as Map<String, dynamic>),
      gradeDetails: json['gradeDetails'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EmployeeProfileValueToJson(
        EmployeeProfileValue instance) =>
    <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'contactInfo': instance.contactInfo,
      'status': instance.status,
      'code': instance.code,
      'employmentType': instance.employmentType,
      'employeeSpecification': instance.employeeSpecification,
      'gradeDetails': instance.gradeDetails,
      'id': instance.id,
    };

EmployeePersonalInfo _$EmployeePersonalInfoFromJson(
        Map<String, dynamic> json) =>
    EmployeePersonalInfo(
      firstName: json['firstName'] as String?,
      arabicFirstName: json['arabicFirstName'] as String?,
      lastName: json['lastName'] as String?,
      arabicLastName: json['arabicLastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      nationality: json['nationality'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      maritalStatus: (json['maritalStatus'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$EmployeePersonalInfoToJson(
        EmployeePersonalInfo instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'arabicFirstName': instance.arabicFirstName,
      'lastName': instance.lastName,
      'arabicLastName': instance.arabicLastName,
      'dateOfBirth': instance.dateOfBirth,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'maritalStatus': instance.maritalStatus,
      'nationalId': instance.nationalId,
    };

EmployeeContactInfo _$EmployeeContactInfoFromJson(Map<String, dynamic> json) =>
    EmployeeContactInfo(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : EmployeeAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeContactInfoToJson(
        EmployeeContactInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };

EmployeeAddress _$EmployeeAddressFromJson(Map<String, dynamic> json) =>
    EmployeeAddress(
      countryName: json['countryName'] as String?,
      cityName: json['cityName'] as String?,
      street: json['street'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$EmployeeAddressToJson(EmployeeAddress instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'cityName': instance.cityName,
      'street': instance.street,
      'postalCode': instance.postalCode,
    };

EmployeeSpecification _$EmployeeSpecificationFromJson(
        Map<String, dynamic> json) =>
    EmployeeSpecification(
      jobTitle: json['jobTitle'] as String?,
      yearOfExperience: (json['yearOfExperience'] as num?)?.toInt(),
      organizationUnitName: json['organizationUnitName'] as String?,
      hiringDate: json['hiringDate'] as String?,
      managerName: json['managerName'] as String?,
    );

Map<String, dynamic> _$EmployeeSpecificationToJson(
        EmployeeSpecification instance) =>
    <String, dynamic>{
      'jobTitle': instance.jobTitle,
      'yearOfExperience': instance.yearOfExperience,
      'organizationUnitName': instance.organizationUnitName,
      'hiringDate': instance.hiringDate,
      'managerName': instance.managerName,
    };
