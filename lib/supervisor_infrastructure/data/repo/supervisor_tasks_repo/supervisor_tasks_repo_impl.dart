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
          endPoint:
              "${ApiConstant.Task}/department/${ApiConstant.departmentId}");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(
          List<GetTasData>.from(
              (result['value'] as List).map((e) => GetTasData.fromJson(e))),
        );
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Delete Task By Id
  Future<Either<Failure, void>> deleteTaskById({required int id}) async {
    try {
      final result =
          await apiService.delete(endPoint: "${ApiConstant.Task}?id=$id");
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
  // Assign Task
  Future<Either<Failure, void>> assignTask(
      {required int taskId, required List<String> employeeIds}) async {
    try {
      final result = await apiService.post(
          endPoint: "${ApiConstant.Task}/assignTask",
          body: {"employeeIds": employeeIds, "taskId": taskId});
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
