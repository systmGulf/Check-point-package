import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/repo/supervisor_tasks_repo/supervisor_tasks_repo.dart';

import '../../models/task_model/add_task_request_body.dart';
import '../../models/task_model/get_task_response.dart';

class SupervisorTasksRepoImpl implements SupervisorTasksRepo {
  final ApiService apiService;

  SupervisorTasksRepoImpl({
    required this.apiService,
  });

  @override
  // add Task
  Future<Either<Failure, void>> addTask(
      {required AddTaskRequestBody addTaskRequestBody}) async {
    try {
      final result = await apiService.post(
          endPoint: ApiConstant.Task, body: addTaskRequestBody.toJson());
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
  // Get all Tasks by Department
  Future<Either<Failure, List<GetTasData>>> getAllTasksByDepartmentId(
      {required int pageNumber}) async {
    try {
      final result = await apiService.get(
          endPoint: "${ApiConstant.Task}");
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'];

        // Supports both paginated and plain-list response shapes.
        if (value is Map<String, dynamic>) {
          final data = value['data'] as List<dynamic>? ?? [];
          return Right(
              List<GetTasData>.from(data.map((e) => GetTasData.fromJson(e))));
        }
        if (value is List) {
          return Right(
              List<GetTasData>.from(value.map((e) => GetTasData.fromJson(e))));
        }

        return const Right([]);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Delete Task By Id
  Future<Either<Failure, void>> deleteTaskById({required String id}) async {
    try {
      await apiService.delete(endPoint: "${ApiConstant.Task}/$id");
      // DELETE can return 204 with empty/non-JSON body, so any successful call is enough.
      return const Right(null);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Assign Task (single or bulk)
  Future<Either<Failure, void>> assignTask({
    required String taskId,
    required String employeeId,
    required String deadLine,
    required int priority,
    required int state,
  }) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.employeeTask,
        body: {
          "employeeId": employeeId,
          "taskId": taskId,
          "deadLine": deadLine,
          "priority": priority,
          "state": state,
        },
      );
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
  // Change Task Status
  Future<Either<Failure, void>> changeTaskStatus(
      {required String taskId, required String status}) async {
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
  Future<Either<Failure, void>> removeSomeEmployeesFromTask(
      {required String taskId, required String employeeIds}) async {
    try {
      final result = await apiService.post(
          endPoint: "${ApiConstant.employee}/removeAssignTask",
          body: {"employeeId": employeeIds, "taskId": taskId});
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
