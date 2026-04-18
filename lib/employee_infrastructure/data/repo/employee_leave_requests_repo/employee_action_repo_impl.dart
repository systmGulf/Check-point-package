import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_leave_requests_models/leave_types_response.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/employee_leave_requests_models/leave_request_request_body.dart';
import '../../models/employee_tasks_reponse_model/employee_tasks_response_model.dart';

class EmployeeActionRepoImpl implements EmployeeActionRepo {
  final ApiService apiService;

  EmployeeActionRepoImpl({
    required this.apiService,
  });

  @override
  // Create Leave Request
  Future<Either<Failure, UserAttendanceModel>> createLeaveRequest(
      LeaveRequestRequestBody leaveRequestRequestBody) async {
    try {
      final result = await apiService.post(
          endPoint: ApiConstant.leaveRequest,
          body: leaveRequestRequestBody.toJson());
      if (result[ApiConstant.successApiKey] == true) {
        return Right(UserAttendanceModel.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get All Leave Requests
  Future<Either<Failure, EmployeeLeaveRequestsModel>>
      getAllLeaveRequestsForEmployee() async {
    try {
      final result = await apiService.get(
          endPoint: "GetRequestsbyEmployeeId/${ApiConstant.employeeId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeLeaveRequestsModel.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Employee Change Password
  Future<Either<Failure, void>> employeeChangePassword(
      ChangePasswordRequestBody changePasswordRequestBody) async {
    try {
      final result = await apiService.put(
          endPoint: ApiConstant.employeeChangePassword,
          body: changePasswordRequestBody.toJson());
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Delete Leave Request
  Future<Either<Failure, void>> deleteLeaveRequest({required int id}) async {
    try {
      final result =
          await apiService.delete(endPoint: "${ApiConstant.leaveRequest}/$id");
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get Leave Requests By Type for employee
  Future<Either<Failure, EmployeeLeaveRequestsModel>>
      getLeaveRequestsByTypeForEmployee({required String type}) async {
    try {
      final result = await apiService.get(
          endPoint:
              "GetRequestsbyEmployeeId/${ApiConstant.employeeId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeLeaveRequestsModel.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get Employee By Department
  Future<Either<Failure, GetAllEmployeesValue>>
      getEmployeeByDepartmentId() async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.employee}/departmentId/${ApiConstant.departmentId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(GetAllEmployeesValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get Employee Tasks
  Future<Either<Failure, EmployeeTaksResponse>> getEmployeeTasks() async {
    try {
      final result =
          await apiService.get(endPoint: "${ApiConstant.employeeTask}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeTaksResponse.fromJson(result));
      } else {
        return Left(
          Failure(
            404,
            getResponseError(result),
          ),
        );
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Change Employee Task Status
  Future<Either<Failure, void>> changeEmployeeTaskStatus(
      {required int taskId, required String status}) async {
    try {
      final result = await apiService.put(
          endPoint: "${ApiConstant.Task}/updateStatus",
          body: {"id": taskId, "status": status});
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Delete Task
  Future<Either<Failure, void>> deleteTask(
      {required String employeeTaskId}) async {
    try {
      await apiService.delete(endPoint: "${ApiConstant.employeeTask}/$employeeTaskId");
      return const Right(null);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, LeaveTypeResponse>> getLeaveTypes() async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.leaveType);
      if (result[ApiConstant.successApiKey] == true) {
        return Right(LeaveTypeResponse.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
