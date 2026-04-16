import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_leave_requests_models/leave_types_response.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/employee_leave_requests_models/leave_request_request_body.dart';
import '../../models/employee_tasks_reponse_model/employee_tasks_response_model.dart';

abstract class EmployeeActionRepo {
  // Create Leave Request
  Future<Either<Failure, UserAttendanceModel>> createLeaveRequest(
      LeaveRequestRequestBody leaveRequestRequestBody);
  // Get all Leave Requests
  Future<Either<Failure, EmployeeLeaveRequestsModel>>
      getAllLeaveRequestsForEmployee();
  // Get Leave Requests By Type
  Future<Either<Failure, LeaveTypeResponse>> getLeaveTypes();
  Future<Either<Failure, EmployeeLeaveRequestsModel>>
      getLeaveRequestsByTypeForEmployee({required String type});
  // Employee Change Password
  Future<Either<Failure, void>> employeeChangePassword(
      ChangePasswordRequestBody changePasswordRequestBody);
  // Delete Leave Request
  Future<Either<Failure, void>> deleteLeaveRequest({required int id});
  // Get Employee By Department Id
  Future<Either<Failure, GetAllEmployeesValue>> getEmployeeByDepartmentId();
  // Get Employee Task

  /// THE MODEL HERE IS WRONG NOW WE WANT TO CREATE A NEW MODEL FOR EMPLOYEE TASKS
  Future<Either<Failure, EmployeeTaksResponse>> getEmployeeTasks();
  // Change Employee Task Status
  Future<Either<Failure, void>> changeEmployeeTaskStatus(
      {required int taskId, required String status});
  // delete task
  Future<Either<Failure, void>> deleteTask(
      {required int taskId, required String employeeId});
}
