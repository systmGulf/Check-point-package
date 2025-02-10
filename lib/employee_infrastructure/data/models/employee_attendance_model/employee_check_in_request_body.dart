import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_check_in_request_body.g.dart';

@JsonSerializable()
class EmployeeCheckInRequestBody {
  @JsonKey(name: 'employeeId')
  final String employeeIdd;
  final String area;
  final String? customerId;
  final String location;
  final String? employeeImage;

  EmployeeCheckInRequestBody(this.customerId, this.employeeImage,
      {required this.employeeIdd, required this.area, required this.location});

  Map<String, dynamic> toJson() => _$EmployeeCheckInRequestBodyToJson(this);
}
