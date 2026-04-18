// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_employee_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmployeeProfileRequestBody _$UpdateEmployeeProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateEmployeeProfileRequestBody(
      personalInfo: json['personalInfo'] == null
          ? null
          : EmployeePersonalInfoRequest.fromJson(
              json['personalInfo'] as Map<String, dynamic>),
      contactInfo: json['contactInfo'] == null
          ? null
          : EmployeeContactInfoRequest.fromJson(
              json['contactInfo'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      code: json['code'] as String?,
      employmentType: (json['employmentType'] as num?)?.toInt(),
      employeeSpecification: json['employeeSpecification'] == null
          ? null
          : EmployeeSpecificationRequest.fromJson(
              json['employeeSpecification'] as Map<String, dynamic>),
      gradeDetails: json['gradeDetails'] == null
          ? null
          : EmployeeGradeDetailsRequest.fromJson(
              json['gradeDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateEmployeeProfileRequestBodyToJson(
        UpdateEmployeeProfileRequestBody instance) =>
    <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'contactInfo': instance.contactInfo,
      'status': instance.status,
      'code': instance.code,
      'employmentType': instance.employmentType,
      'employeeSpecification': instance.employeeSpecification,
      'gradeDetails': instance.gradeDetails,
    };

EmployeePersonalInfoRequest _$EmployeePersonalInfoRequestFromJson(
        Map<String, dynamic> json) =>
    EmployeePersonalInfoRequest(
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

Map<String, dynamic> _$EmployeePersonalInfoRequestToJson(
        EmployeePersonalInfoRequest instance) =>
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

EmployeeContactInfoRequest _$EmployeeContactInfoRequestFromJson(
        Map<String, dynamic> json) =>
    EmployeeContactInfoRequest(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : EmployeeAddressRequest.fromJson(
              json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeContactInfoRequestToJson(
        EmployeeContactInfoRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };

EmployeeAddressRequest _$EmployeeAddressRequestFromJson(
        Map<String, dynamic> json) =>
    EmployeeAddressRequest(
      countryName: json['countryName'] as String?,
      cityName: json['cityName'] as String?,
      street: json['street'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$EmployeeAddressRequestToJson(
        EmployeeAddressRequest instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'cityName': instance.cityName,
      'street': instance.street,
      'postalCode': instance.postalCode,
    };

EmployeeSpecificationRequest _$EmployeeSpecificationRequestFromJson(
        Map<String, dynamic> json) =>
    EmployeeSpecificationRequest(
      jobTitle: json['jobTitle'] as String?,
      yearOfExperience: (json['yearOfExperience'] as num?)?.toInt(),
      organizationUnitName: json['organizationUnitName'] as String?,
      hiringDate: json['hiringDate'] as String?,
      managerName: json['managerName'] as String?,
    );

Map<String, dynamic> _$EmployeeSpecificationRequestToJson(
        EmployeeSpecificationRequest instance) =>
    <String, dynamic>{
      'jobTitle': instance.jobTitle,
      'yearOfExperience': instance.yearOfExperience,
      'organizationUnitName': instance.organizationUnitName,
      'hiringDate': instance.hiringDate,
      'managerName': instance.managerName,
    };

EmployeeGradeDetailsRequest _$EmployeeGradeDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    EmployeeGradeDetailsRequest(
      title: json['title'] as String?,
      code: json['code'] as String?,
      minSalary: json['minSalary'] as num?,
      maxSalary: json['maxSalary'] as num?,
    );

Map<String, dynamic> _$EmployeeGradeDetailsRequestToJson(
        EmployeeGradeDetailsRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
    };
