import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_plan_by_employee_id_model.g.dart';

@JsonSerializable()
class GetPlanByEmployeeIdModel {
  GetPlanByEmployeeIdValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  GetPlanByEmployeeIdModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});
factory GetPlanByEmployeeIdModel.fromJson(Map<String, dynamic> json) => _$GetPlanByEmployeeIdModelFromJson(json);
}
@JsonSerializable()

class GetPlanByEmployeeIdValue {
  List<GetPlanByEmployeeIdData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  GetPlanByEmployeeIdValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});

  factory GetPlanByEmployeeIdValue.fromJson(Map<String, dynamic> json) => _$GetPlanByEmployeeIdValueFromJson(json);
}
@JsonSerializable()

class GetPlanByEmployeeIdData {
  int? id;
  String? planDate;
  String? note;

  GetPlanByEmployeeIdData({this.id, this.planDate, this.note});

  factory GetPlanByEmployeeIdData.fromJson(Map<String, dynamic> json) => _$GetPlanByEmployeeIdDataFromJson(json);
}
