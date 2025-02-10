import 'package:dartz/dartz.dart';
import '../../../../supervisor_infrastructure/data/models/task_model/get_task_response.dart';
import '../../../../hr_manamgement_system_package.dart';

abstract class EmployeeActionRepo {
  // Create Leave Request
  Future<Either<Failure, UserAttendanceModel>> createLeaveRequest(
      LeaveRequestRequestBody leaveRequestRequestBody);
  // Get all Leave Requests
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getAllLeaveRequestsForEmployee();
  // Get Leave Requests By Type
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getLeaveRequestsByTypeForEmployee({required String type});
  // Employee Change Password
  Future<Either<Failure, void>> employeeChangePassword(
      ChangePasswordRequestBody changePasswordRequestBody);
  // Delete Leave Request
  Future<Either<Failure, void>> deleteLeaveRequest({required int id});
  // Get Employee By Department Id
  Future<Either<Failure, GetAllEmployeesValue>> getEmployeeByDepartmentId();
  // Get Employee Task
  Future<Either<Failure, List<GetTasData>>> getEmployeeTasks();
  // Change Employee Task Status
  Future<Either<Failure, void>> changeEmployeeTaskStatus(
      {required int taskId, required String status});
}
