import 'package:equatable/equatable.dart';

import '../../../data/models/plan_model/plans_v2_models.dart';

class PlanManagementState extends Equatable {
  final List<PlanV2Item> plans;
  final PlanV2Item? lastCreatedPlan;
  final bool isFetchingPlans;
  final bool isCreatingPlan;
  final bool isAssigningPlan;
  final String? successMessage;
  final String? errorMessage;

  const PlanManagementState({
    this.plans = const [],
    this.lastCreatedPlan,
    this.isFetchingPlans = false,
    this.isCreatingPlan = false,
    this.isAssigningPlan = false,
    this.successMessage,
    this.errorMessage,
  });

  static const _keep = Object();

  PlanManagementState copyWith({
    List<PlanV2Item>? plans,
    Object? lastCreatedPlan = _keep,
    bool? isFetchingPlans,
    bool? isCreatingPlan,
    bool? isAssigningPlan,
    Object? successMessage = _keep,
    Object? errorMessage = _keep,
  }) {
    return PlanManagementState(
      plans: plans ?? this.plans,
      lastCreatedPlan: identical(lastCreatedPlan, _keep)
          ? this.lastCreatedPlan
          : lastCreatedPlan as PlanV2Item?,
      isFetchingPlans: isFetchingPlans ?? this.isFetchingPlans,
      isCreatingPlan: isCreatingPlan ?? this.isCreatingPlan,
      isAssigningPlan: isAssigningPlan ?? this.isAssigningPlan,
      successMessage: identical(successMessage, _keep)
          ? this.successMessage
          : successMessage as String?,
      errorMessage: identical(errorMessage, _keep)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }

  @override
  List<Object?> get props => [
        plans,
        lastCreatedPlan,
        isFetchingPlans,
        isCreatingPlan,
        isAssigningPlan,
        successMessage,
        errorMessage,
      ];
}
