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
  factory GetPlanByEmployeeIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetPlanByEmployeeIdModelFromJson(json);
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

  factory GetPlanByEmployeeIdValue.fromJson(Map<String, dynamic> json) =>
      _$GetPlanByEmployeeIdValueFromJson(json);
}

@JsonSerializable()
class GetPlanByEmployeeIdData {
  final int? id;
  final String? note;
  final Customer? customer;
  final Plan? plan;
  final bool? visited;
  final List<FeedbackModel>? feedbacks;
  final String? createdDate;

  GetPlanByEmployeeIdData({
    this.id,
    this.note,
    this.customer,
    this.plan,
    this.visited,
    this.feedbacks,
    this.createdDate,
  });

  factory GetPlanByEmployeeIdData.fromJson(Map<String, dynamic> json) =>
      _$GetPlanByEmployeeIdDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlanByEmployeeIdDataToJson(this);
}

@JsonSerializable()
class Customer {
  final String? id;
  final String? name;
  final String? workesAs;
  final String? location;
  final String? customerType;
  final List<Coordinate>? coordinates;

  Customer({
    this.id,
    this.name,
    this.workesAs,
    this.location,
    this.customerType,
    this.coordinates,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Coordinate {
  final double? latitude;
  final double? longitude;

  Coordinate({
    this.latitude,
    this.longitude,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}

@JsonSerializable()
class Plan {
  int? id;
  DateTime? planDate;
  String? note;
  String? departmentName;

  Plan({
    this.id,
    this.planDate,
    this.note,
    this.departmentName,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}

@JsonSerializable()
class FeedbackModel {
  final int? id;
  final String? imageUrl;
  final String? notes;
  final String? status;

  FeedbackModel({
    this.id,
    this.imageUrl,
    this.notes,
    this.status,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
