import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_police_by_shift_id.g.dart';

@JsonSerializable()
class PoliceResponse {
  Value? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  PoliceResponse(
      {this.value,
      this.status,
      this.isSuccess,
      this.successMessage,
      this.correlationId,
      this.errors,
      this.validationErrors});

  factory PoliceResponse.fromJson(Map<String, dynamic> json) =>
      _$PoliceResponseFromJson(json);
}

@JsonSerializable()
class Value {
  List<Data>? data;
  int? totalCount;
  int? pageCount;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? start;
  int? end;

  Value(
      {this.data,
      this.totalCount,
      this.pageCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.start,
      this.end});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  int? month;
  int? year;
  String? clockInTime;
  String? clockOutTime;
  String? area;
  Shift? shift;

  Data(
      {this.id,
      this.month,
      this.year,
      this.clockInTime,
      this.clockOutTime,
      this.area,
      this.shift});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Shift {
  int? id;
  String? name;

  Shift({this.id, this.name});

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}
