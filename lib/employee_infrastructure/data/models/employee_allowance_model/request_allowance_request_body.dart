import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_allowance_request_body.g.dart';

@JsonSerializable()
class RequestAllowanceRequestBody {
  RequestAllowanceRequestBody({
    this.beneficiaryAllowanceId,
    this.allowanceId,
    this.employeeId,
    this.requestNotes,
  });

  final String? beneficiaryAllowanceId;
  final String? allowanceId;
  final String? employeeId;
  final String? requestNotes;

  factory RequestAllowanceRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RequestAllowanceRequestBodyFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$RequestAllowanceRequestBodyToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
