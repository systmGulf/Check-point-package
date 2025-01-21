
 import 'package:freezed_annotation/freezed_annotation.dart';
part 'assign_shifts_request_body.g.dart';
@JsonSerializable()
class AssignShiftsRequestBody {
  final int shiftId;
  final List<int> branchesIds;

  AssignShiftsRequestBody({required this.shiftId, required this.branchesIds});
  Map<String, dynamic> toJson() => _$AssignShiftsRequestBodyToJson(this);
}