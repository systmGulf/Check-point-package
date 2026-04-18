import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_check_in_request_body.g.dart';

@JsonSerializable()
class EmployeeCheckInRequestBody {
  final String date;
  final String checkIn;
  final String checkOut;

  EmployeeCheckInRequestBody({
    required this.date,
    required this.checkIn,
    required this.checkOut,
  });

  Map<String, dynamic> toJson() => _$EmployeeCheckInRequestBodyToJson(this);
}
