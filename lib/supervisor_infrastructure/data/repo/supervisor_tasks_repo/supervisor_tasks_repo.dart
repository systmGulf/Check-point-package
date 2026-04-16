import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/task_model/get_task_response.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/task_model/add_task_request_body.dart';

abstract class SupervisorTasksRepo {
  // add Tasks
  Future<Either<Failure, void>> addTask(
      {required AddTaskRequestBody addTaskRequestBody});

  // Get all Tasks by department Id
  Future<Either<Failure, List<GetTasData>>> getAllTasksByDepartmentId(
      {required int pageNumber});

  // Delete Task by id
  Future<Either<Failure, void>> deleteTaskById({required String id});

  Future<Either<Failure, void>> removeSomeEmployeesFromTask(
      {required String taskId, required String employeeIds});

  // Assign Task to one/many employees
  Future<Either<Failure, void>> assignTask({
    required String taskId,
    required String employeeId,
    required String deadLine,
    required int priority,
    required int state,
  });

  // Change Task Status from Pending to Completed Or inProgress
  Future<Either<Failure, void>> changeTaskStatus(
      {required String taskId, required String status});
}
