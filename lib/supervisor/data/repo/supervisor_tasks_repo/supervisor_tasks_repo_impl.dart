import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';
import 'package:hr_management_system_package/supervisor/data/repo/supervisor_tasks_repo/supervisor_tasks_repo.dart';

import '../../../../core/errors/internet_checker.dart';
import '../../models/task_model/add_task_request_body.dart';
import '../../models/task_model/get_task_response.dart';

class SupervisorTasksRepoImpl implements SupervisorTasksRepo {
  final ApiService apiservice;
  final NetworkInfo networkInfo;

  SupervisorTasksRepoImpl(
      {required this.apiservice, required this.networkInfo});
  @override
  // Add Task
  Future<Either<Failure, void>> addTask(
      {required AddTaskRequestBody addTaskRequestBody}) async {
    final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Task, body: addTaskRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // Get All Tasks By Department
  Future<Either<Failure, List<GetTasData>>> getAllTasksByDepartmentId(
      {required int pageNumber}) async {
    final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.get(
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // Delete Task ById
  Future<Either<Failure, void>> deleteTaskById({required int id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result =
            await apiservice.delete(endPoint: "${ApiConstant.Task}?id=$id");
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // Assign Task To Employees
  Future<Either<Failure, void>> assignTask(
      {required int taskId, required List<String> employeeIds}) async {
     final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.post(
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // Change Task Status from Pending to Completed Or inProgress
  Future<Either<Failure, void>> changeTaskStatus(
      {required int taskId, required String status}) async {
    final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.put(
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
