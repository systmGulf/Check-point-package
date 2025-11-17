import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../../../supervisor_infrastructure/data/models/task_model/get_task_response.dart';
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
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getAllLeaveRequestsForEmployee() async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.getAllLeaveRequestsForEmployee}/${ApiConstant.employeeId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeLeaveRequestsValue.fromJson(result['value']));
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
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getLeaveRequestsByTypeForEmployee({required String type}) async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.getAllLeaveRequestsForEmployee}/${ApiConstant.employeeId}/leaveType/$type");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeLeaveRequestsValue.fromJson(result['value']));
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
  Future<Either<Failure,EmployeeTasksResponseBody>> getEmployeeTasks() async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.Task}/specificEmployee?employeeId=${ApiConstant.employeeId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(
          EmployeeTasksResponseBody.fromJson(result)
        );
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
}
