import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_employee_profile_request_body.g.dart';

@JsonSerializable()
class UpdateEmployeeProfileRequestBody {
  EmployeePersonalInfoRequest? personalInfo;
  EmployeeContactInfoRequest? contactInfo;
  int? status;
  String? code;
  int? employmentType;
  EmployeeSpecificationRequest? employeeSpecification;
  EmployeeGradeDetailsRequest? gradeDetails;

  UpdateEmployeeProfileRequestBody({
    this.personalInfo,
    this.contactInfo,
    this.status,
    this.code,
    this.employmentType,
    this.employeeSpecification,
    this.gradeDetails,
  });

  factory UpdateEmployeeProfileRequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateEmployeeProfileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateEmployeeProfileRequestBodyToJson(this);
}

@JsonSerializable()
class EmployeePersonalInfoRequest {
  String? firstName;
  String? arabicFirstName;
  String? lastName;
  String? arabicLastName;
  String? dateOfBirth;
  String? nationality;
  int? gender;
  int? maritalStatus;
  String? nationalId;

  EmployeePersonalInfoRequest({
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

  factory EmployeePersonalInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeePersonalInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeePersonalInfoRequestToJson(this);
}

@JsonSerializable()
class EmployeeContactInfoRequest {
  String? email;
  String? phone;
  EmployeeAddressRequest? address;

  EmployeeContactInfoRequest({
    this.email,
    this.phone,
    this.address,
  });

  factory EmployeeContactInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeContactInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeContactInfoRequestToJson(this);
}

@JsonSerializable()
class EmployeeAddressRequest {
  String? countryName;
  String? cityName;
  String? street;
  String? postalCode;

  EmployeeAddressRequest({
    this.countryName,
    this.cityName,
    this.street,
    this.postalCode,
  });

  factory EmployeeAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeAddressRequestToJson(this);
}

@JsonSerializable()
class EmployeeSpecificationRequest {
  String? jobTitle;
  int? yearOfExperience;
  String? organizationUnitName;
  String? hiringDate;
  String? managerName;

  EmployeeSpecificationRequest({
    this.jobTitle,
    this.yearOfExperience,
    this.organizationUnitName,
    this.hiringDate,
    this.managerName,
  });

  factory EmployeeSpecificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSpecificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeSpecificationRequestToJson(this);
}

@JsonSerializable()
class EmployeeGradeDetailsRequest {
  String? title;
  String? code;
  num? minSalary;
  num? maxSalary;

  EmployeeGradeDetailsRequest({
    this.title,
    this.code,
    this.minSalary,
    this.maxSalary,
  });

  factory EmployeeGradeDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeGradeDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeGradeDetailsRequestToJson(this);
}
