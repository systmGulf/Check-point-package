import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../../../supervisor/data/models/task_model/get_task_response.dart';

class EmployeeRepoImpl implements EmployeeRepo {
  final ApiService apiservice;
  
  EmployeeRepoImpl(
   {
    required this.apiservice,
  });

  @override
  Future<Either<Failure, UserAttendanceModel>> createLeaveRequest(
      LeaveRequestRequestBody leaveRequestRequestBody) async {
    try {
        final result = await apiservice.post(
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
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getAllLeaveRequestsForEmployee() async {
   try {
        final result = await apiservice.get(
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
  Future<Either<Failure, void>> employeeChangePassword(
      ChangePasswordRequestBody changePasswordRequestBody) async {
  try {
        final result = await apiservice.put(
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
  Future<Either<Failure, void>> deleteLeaveRequest({required int id}) async {
    try {
      final result =
          await apiservice.delete(endPoint: "${ApiConstant.leaveRequest}/$id");
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
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getLeaveRequestsByTypeForEmployee({required String type}) async {
   try {
        final result = await apiservice.get(
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
  Future<Either<Failure, GetAllEmployeesValue>>
      getEmployeeByDepartmentId() async {
  try {
        final result = await apiservice.get(
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
  Future<Either<Failure, List<GetTasData>>> getMyTasks() async {
   try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.Task}/specificEmployee?employeeId=${ApiConstant.employeeId}");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(
            List<GetTasData>.from(
              result['value'].map(
                (x) => GetTasData.fromJson(x),
              ),
            ),
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
  Future<Either<Failure, void>> changeTaskStatus(
      {required int taskId, required String status}) async {
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
