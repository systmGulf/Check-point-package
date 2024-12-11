
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_leave_request_model.g.dart';
@JsonSerializable()
class GetLeaveRequestModel {
  GetLeaveRequestValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  GetLeaveRequestModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

 factory GetLeaveRequestModel.fromJson(Map<String, dynamic> json) => _$GetLeaveRequestModelFromJson(json);
  }

 
@JsonSerializable()

class GetLeaveRequestValue {
  List<GetLeaveRequestData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  GetLeaveRequestValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});

  factory GetLeaveRequestValue.fromJson(Map<String, dynamic> json) => 
      _$GetLeaveRequestValueFromJson(json);
}
@JsonSerializable()

class GetLeaveRequestData {
  int? id;
  String? startDate;
  String? endDate;
  String? reason;
  String? remark;
  String? status;
  String? leaveRequestType;
  String? employeeId;
  String? employeeName;
  String? createdDate;
  String? createdBy;

  GetLeaveRequestData(
      {this.id,
      this.startDate,
      this.endDate,
      this.reason,
      this.remark,
      this.status,
      this.leaveRequestType,
      this.employeeId,
      this.employeeName,
      this.createdDate,
      this.createdBy});

  factory GetLeaveRequestData.fromJson(Map<String, dynamic> json) => 
      _$GetLeaveRequestDataFromJson(json);
}
