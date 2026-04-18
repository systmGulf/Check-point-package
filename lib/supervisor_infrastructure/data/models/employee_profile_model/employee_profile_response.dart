import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_profile_response.g.dart';

@JsonSerializable()
class EmployeeProfileResponse {
  EmployeeProfileValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  EmployeeProfileResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory EmployeeProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeProfileResponseFromJson(json);
}

@JsonSerializable()
class EmployeeProfileValue {
  EmployeePersonalInfo? personalInfo;
  EmployeeContactInfo? contactInfo;
  int? status;
  String? code;
  int? employmentType;
  EmployeeSpecification? employeeSpecification;
  dynamic gradeDetails;
  String? id;

  EmployeeProfileValue({
    this.personalInfo,
    this.contactInfo,
    this.status,
    this.code,
    this.employmentType,
    this.employeeSpecification,
    this.gradeDetails,
    this.id,
  });

  factory EmployeeProfileValue.fromJson(Map<String, dynamic> json) =>
      _$EmployeeProfileValueFromJson(json);
}

@JsonSerializable()
class EmployeePersonalInfo {
  String? firstName;
  String? arabicFirstName;
  String? lastName;
  String? arabicLastName;
  String? dateOfBirth;
  String? nationality;
  int? gender;
  int? maritalStatus;
  String? nationalId;

  EmployeePersonalInfo({
    this.firstName,
    this.arabicFirstName,
    this.lastName,
    this.arabicLastName,
    this.dateOfBirth,
    this.nationality,
    this.gender,
    this.maritalStatus,
    this.nationalId,
  });

  factory EmployeePersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeePersonalInfoFromJson(json);
}

@JsonSerializable()
class EmployeeContactInfo {
  String? email;
  String? phone;
  EmployeeAddress? address;

  EmployeeContactInfo({
    this.email,
    this.phone,
    this.address,
  });

  factory EmployeeContactInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeContactInfoFromJson(json);
}

@JsonSerializable()
class EmployeeAddress {
  String? countryName;
  String? cityName;
  String? street;
  String? postalCode;

  EmployeeAddress({
    this.countryName,
    this.cityName,
    this.street,
    this.postalCode,
  });

  factory EmployeeAddress.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAddressFromJson(json);
}

@JsonSerializable()
class EmployeeSpecification {
  String? jobTitle;
  int? yearOfExperience;
  String? organizationUnitName;
  String? hiringDate;
  String? managerName;

  EmployeeSpecification({
    this.jobTitle,
    this.yearOfExperience,
    this.organizationUnitName,
    this.hiringDate,
    this.managerName,
  });

  factory EmployeeSpecification.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSpecificationFromJson(json);
}
