import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_account_request_model.g.dart';

@JsonSerializable()
class AddAccountRequestModel {
  AddAccountRequestValue? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  AddAccountRequestModel(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory AddAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddAccountRequestModelFromJson(json);
}

@JsonSerializable()
class AddAccountRequestValue {
  List<AddAccountRequestData>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  AddAccountRequestValue(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});
  factory AddAccountRequestValue.fromJson(Map<String, dynamic> json) =>
      _$AddAccountRequestValueFromJson(json);
}

@JsonSerializable()
class AddAccountRequestData {
  int? id;
  String? name;
  String? mobileId;
  String? deviceToken;
  DateTime? createdDate;

  AddAccountRequestData(
      {this.id, this.name, this.mobileId, this.deviceToken, this.createdDate});

  factory AddAccountRequestData.fromJson(Map<String, dynamic> json) =>
      _$AddAccountRequestDataFromJson(json);
}
