import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor/data/models/customers/get_customer_by_id_model.dart';

import '../../../employee/data/models/user_attendace_model/employee_check_in_request_body.dart';
import '../../../employee/data/models/user_attendace_model/user_tracking_summary_response_model.dart';
import '../../../hr_manamgement_system_package.dart';
import '../models/employee_summary_model/employee_summary_model.dart';
import '../models/employees_attendance_model/get_employee_attendance.dart';
import '../models/plan_model/customer_plan_model.dart';
import '../models/plan_model/get_plan_by_id_model.dart';
import '../models/plan_model/get_plan_model.dart';
import '../models/plan_model/set_customer_plan_request_body.dart';
import '../models/task_model/add_task_request_body.dart';
import '../models/task_model/get_task_response.dart';

abstract class SupervisorRepo {
  // Attendance
  Future<Either<Failure, List<GetLeaveRequestModel>>>
      supervisorGetEmployeeLeaveRequest();
  Future<Either<Failure, List<SupervisorGetAllEmployeesAttendanceModel>>>
      supervisorGetAllEmployeesAttendance();
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      getEmployeeAttendanceByDepartmentId({required String attendanceDate});
  Future<Either<Failure, List<GetAllEmployeesValue>>> getAllEmployees();
  Future<Either<Failure, GetAllEmployeesValue>> getEmployeeByDepartmentId();

  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody);
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckOut(
      String EmployeeId, String? employeeImage);
  Future<Either<Failure, EmployeeSummaryValue>> getEmployeeSummary(
      {required String employeeId, required int month, required int year});
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetLateComers({required String day});
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetEarlyLeavers({required String day});
  Future<Either<Failure, UserTrackingSummaryResponseBody>>
      getTrackingSummaryForEmployee(
          {required String data, required String employeeId});

  // requests
  Future<Either<Failure, void>> approveOrRejectLeaveRequest(
      {required String status, required int id});
  Future<Either<Failure, GetLeaveRequestModel>>
      getLeaveRequestsByTypeForDepartment({
    required String type,
  });

  // plans
  Future<Either<Failure, List<CustomerPlanModel>>> getCustomerPlans();
  Future<Either<Failure, void>> setPlanByDate(
      SetPlanByDateRequestBody setPlanByDateRequestBody);

  Future<Either<Failure, GetPlanByIdValue>> getPlanById({required int id});
  Future<Either<Failure, void>> deletePlanById({required int id});
  Future<Either<Failure, void>> setCustomerPlan(
      SetCustomerPlanRequestBody setCustomerPlanRequestBody);
  Future<Either<Failure, void>> setSubPlan(
      {required setSubPlansRequestBody setSubPlansRequestBody});
  Future<Either<Failure, void>> deleteSubPlanById({required int id});
  Future<Either<Failure, PlanValue>> getPlanByDepartmentId();

  Future<Either<Failure, GetCustomerByIdModel>> getCustomerById(
      {required String CustomerId});

  // tasks
  Future<Either<Failure, void>> addTask(
      {required AddTaskRequestBody addTaskRequestBody});
  Future<Either<Failure, List<GetTasData>>> getAllTasksByDepartmentId(
      {required int pageNumber});
  Future<Either<Failure, void>> deleteTaskById({required int id});
  Future<Either<Failure, void>> assignTask(
      {required int taskId, required List<String> employeeIds});
  Future<Either<Failure, void>> changeTaskStatus(
      {required int taskId, required String status});
}

// 26 FUN /// PLease refact All Supervisor Repo Methods
