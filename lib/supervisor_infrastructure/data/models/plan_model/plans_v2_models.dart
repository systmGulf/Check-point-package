class CreatePlanRequestBody {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String notes;
  final List<CreateSubPlanRequestBody> subPlans;

  const CreatePlanRequestBody({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.notes,
    this.subPlans = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'notes': notes,
      'subPlans': subPlans.map((item) => item.toJson()).toList(),
    };
  }
}

class CreateSubPlanRequestBody {
  final String title;
  final String description;
  final String dueDate;
  final String notes;

  const CreateSubPlanRequestBody({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'notes': notes,
    };
  }
}

class AssignPlanToEmployeeRequestBody {
  final String planId;
  final String employeeId;

  const AssignPlanToEmployeeRequestBody({
    required this.planId,
    required this.employeeId,
  });

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'employeeId': employeeId,
    };
  }
}

class PlansV2Response {
  final List<PlanV2Item> value;
  final int? status;
  final bool? isSuccess;
  final String? successMessage;
  final String? correlationId;
  final List<dynamic>? errors;
  final List<dynamic>? validationErrors;

  const PlansV2Response({
    this.value = const [],
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory PlansV2Response.fromJson(Map<String, dynamic> json) {
    return PlansV2Response(
      value: (json['value'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(PlanV2Item.fromJson)
          .toList(),
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );
  }
}

class PlanV2Item {
  final String? id;
  final String? title;
  final String? description;
  final int? status;
  final String? startDate;
  final String? endDate;
  final String? notes;
  final List<SubPlanV2Item> subPlans;

  const PlanV2Item({
    this.id,
    this.title,
    this.description,
    this.status,
    this.startDate,
    this.endDate,
    this.notes,
    this.subPlans = const [],
  });

  factory PlanV2Item.fromJson(Map<String, dynamic> json) {
    return PlanV2Item(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      notes: json['notes'] as String?,
      subPlans: (json['subPlans'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(SubPlanV2Item.fromJson)
          .toList(),
    );
  }
}

class SubPlanV2Item {
  final String? id;
  final String? planId;
  final String? title;
  final String? description;
  final int? status;
  final String? dueDate;
  final String? completedAt;
  final String? notes;

  const SubPlanV2Item({
    this.id,
    this.planId,
    this.title,
    this.description,
    this.status,
    this.dueDate,
    this.completedAt,
    this.notes,
  });

  factory SubPlanV2Item.fromJson(Map<String, dynamic> json) {
    return SubPlanV2Item(
      id: json['id'] as String?,
      planId: json['planId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      dueDate: json['dueDate'] as String?,
      completedAt: json['completedAt'] as String?,
      notes: json['notes'] as String?,
    );
  }
}
