import 'package:bloc/bloc.dart';

import '../../../data/models/plan_model/plans_v2_models.dart';
import '../../../data/repo/supervisor_plans_repo/supervisor_plan_repo.dart';
import 'plan_management_state.dart';

class PlanManagementCubit extends Cubit<PlanManagementState> {
  final SupervisorPlanRepo supervisorPlanRepo;

  PlanManagementCubit({
    required this.supervisorPlanRepo,
  }) : super(const PlanManagementState());

  Future<void> fetchPlans() async {
    emit(state.copyWith(
      isFetchingPlans: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await supervisorPlanRepo.getPlans();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isFetchingPlans: false,
          errorMessage: failure.message,
        ),
      ),
      (plans) => emit(
        state.copyWith(
          plans: plans,
          isFetchingPlans: false,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> createPlan({
    required CreatePlanRequestBody body,
    bool refreshPlansAfterCreate = true,
  }) async {
    emit(state.copyWith(
      isCreatingPlan: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await supervisorPlanRepo.createPlan(body: body);
    await result.fold(
      (failure) async => emit(
        state.copyWith(
          isCreatingPlan: false,
          errorMessage: failure.message,
        ),
      ),
      (createdPlan) async {
        emit(
          state.copyWith(
            isCreatingPlan: false,
            lastCreatedPlan: createdPlan,
            successMessage: 'Plan created successfully',
            errorMessage: null,
          ),
        );

        if (refreshPlansAfterCreate) {
          await fetchPlans();
        }
      },
    );
  }

  Future<void> assignPlanToEmployee({
    required String planId,
    required String employeeId,
  }) async {
    emit(state.copyWith(
      isAssigningPlan: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await supervisorPlanRepo.assignPlanToEmployee(
      body: AssignPlanToEmployeeRequestBody(
        planId: planId,
        employeeId: employeeId,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isAssigningPlan: false,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isAssigningPlan: false,
          successMessage: 'Plan assigned successfully',
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> createPlanAndAssignToEmployee({
    required CreatePlanRequestBody createPlanBody,
    required String employeeId,
  }) async {
    await createPlan(body: createPlanBody, refreshPlansAfterCreate: false);

    final createdPlanId = state.lastCreatedPlan?.id;
    if (createdPlanId == null || createdPlanId.isEmpty) {
      emit(state.copyWith(
        errorMessage:
            'Plan created but no plan id returned. Please fetch plans and assign manually.',
      ));
      return;
    }

    await assignPlanToEmployee(
      planId: createdPlanId,
      employeeId: employeeId,
    );

    await fetchPlans();
  }

  void clearMessages() {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));
  }
}
