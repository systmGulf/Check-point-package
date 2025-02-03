import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';
import 'package:hr_management_system_package/supervisor/data/repo/supervisor_tasks_repo/supervisor_tasks_repo.dart';

import '../../../../core/common_methods/network_checker.dart';
import '../../models/task_model/add_task_request_body.dart';
import '../../models/task_model/get_task_response.dart';

class SupervisorTasksRepoImpl implements SupervisorTasksRepo {
  final ApiService apiservice;
  final NetworkChecker networkInfo;

  SupervisorTasksRepoImpl({required this.apiservice, required this.networkInfo});

  @override
  Future<Either<Failure, void>> addTask({required AddTaskRequestBody addTaskRequestBody}) async {
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
  }

  @override
  Future<Either<Failure, List<GetTasData>>> getAllTasksByDepartmentId({required int pageNumber}) async {
    try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.Task}/department/${ApiConstant.departmentId}");
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
  Future<Either<Failure, void>> deleteTaskById({required int id}) async {
     try {
        final result = await apiservice.delete(endPoint: "${ApiConstant.Task}?id=$id");
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
  Future<Either<Failure, void>> assignTask({required int taskId, required List<String> employeeIds}) async {
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
  }

  @override
  Future<Either<Failure, void>> changeTaskStatus({required int taskId, required String status}) async {
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
}
}