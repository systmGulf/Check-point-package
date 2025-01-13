import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor/data/models/customers/get_customer_by_id_model.dart';
import '../models/task_model/add_task_request_body.dart';
import '../models/task_model/get_task_response.dart';
import '../../../employee/data/models/user_attendace_model/employee_check_in_request_body.dart';
import '../../../hr_manamgement_system_package.dart';
import '../models/employee_summary_model/employee_summary_model.dart';
import '../models/plan_model/customer_plan_model.dart';
import '../models/plan_model/get_plan_by_id_model.dart';
import '../models/plan_model/get_plan_model.dart';
import '../models/plan_model/set_customer_plan_request_body.dart';

import '../../../core/errors/internet_checker.dart';
import '../models/employees_attendance_model/get_employee_attendance.dart';

class SupervisorRepoImpl implements SupervisorRepo {
  final ApiService apiservice;
  final NetworkInfo networkInfo;

  SupervisorRepoImpl({required this.apiservice, required this.networkInfo});

  @override
  Future<Either<Failure, List<GetLeaveRequestModel>>>
      supervisorGetEmployeeLeaveRequest() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(endPoint: ApiConstant.leaveRequest);
        if (result['isSuccess'] == true) {
          return Right((result['value'] as List)
              .map((e) => GetLeaveRequestModel.fromJson(e))
              .toList());
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
  Future<Either<Failure, void>> approveOrRejectLeaveRequest(
      {required String status, required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.put(
            endPoint: "${ApiConstant.leaveRequest}/$id/status/$status",
            body: {});
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, List<SupervisorGetAllEmployeesAttendanceModel>>>
      supervisorGetAllEmployeesAttendance() async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiservice.get(endPoint: ApiConstant.getEmployeeAttendance);
        if (result['isSuccess'] == true) {
          return Right((result['value'] as List)
              .map((e) => SupervisorGetAllEmployeesAttendanceModel.fromJson(e))
              .toList());
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
  Future<Either<Failure, List<GetAllEmployeesValue>>> getAllEmployees() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(endPoint: ApiConstant.employee);
        if (result['isSuccess'] == true) {
          return Right((result['value'] as List)
              .map((e) => GetAllEmployeesValue.fromJson(e))
              .toList());
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
  Future<Either<Failure, GetLeaveRequestValue>>
      getLeaveRequestsByTypeForDepartment({required String type}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.leaveRequest}/departmentId/${ApiConstant.departmentId}/leaveType/$type");
        if (result['isSuccess'] == true) {
          return Right(GetLeaveRequestValue.fromJson(result['value']));
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
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      getEmployeeAttendanceByDepartmentId(
          {required String attendanceDate}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.getEmployeeAttendance}/departmentId/${ApiConstant.departmentId}?attendenceDate=$attendanceDate");
        if (result['isSuccess'] == true) {
          return Right(SupervisorGetAllEmployeesAttendanceValue.fromJson(
              result['value']));
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
  Future<Either<Failure, GetAllEmployeesValue>>
      getEmployeeByDepartmentId() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.employee}/departmentId/${ApiConstant.departmentId}");
        if (result['isSuccess'] == true) {
          return Right(GetAllEmployeesValue.fromJson(result['value']));
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
  Future<Either<Failure, void>> setCustomerPlan(
      SetCustomerPlanRequestBody setCustomerPlanRequestBody) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.plan,
            body: setCustomerPlanRequestBody.toJson());
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, List<CustomerPlanModel>>> getCustomerPlans() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.plan}/departmentId/${ApiConstant.departmentId}");
        if (result['isSuccess'] == true) {
          return Right((result['value'] as List)
              .map((e) => CustomerPlanModel.fromJson(e))
              .toList());
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
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody) async {
    if (await networkInfo.isConnected) {
      try {
        if (employeeCheckInRequestBody.employeeImage != null) {
          final result = await apiservice.post(
              endPoint: ApiConstant.employeeCheckIn,
              body: employeeCheckInRequestBody.toJson());
          if (result['isSuccess'] == true) {
            return const Right(null);
          } else {
            return Left(Failure(200, getResponseError(result)));
          }
        } else {
          return Left(Failure(200, "Image is required"));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckOut(
      String employeeId, String? employeeImage) async {
    if (await networkInfo.isConnected) {
      try {
        if (employeeImage != null) {
          final result = await apiservice.post(
              endPoint: "${ApiConstant.employeeCheckOut}",
              body: {"employeeId": employeeId, "employeeImage": employeeImage});
          if (result['isSuccess'] == true) {
            return const Right(null);
          } else {
            return Left(Failure(404, getResponseError(result)));
          }
        } else {
          return Left(Failure(404, "Image is required"));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, EmployeeSummaryValue>> getEmployeeSummary(
      {required String employeeId,
      required int month,
      required int year}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.getEmployeeAttendance}/attendanceSummary?employeeId=$employeeId&year=$year&month=$month");
        if (result['isSuccess'] == true) {
          return Right(EmployeeSummaryValue.fromJson(result['value']));
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
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetLateComers({required String day}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.getEmployeeAttendance}/lateComers/$day");
        if (result['isSuccess'] == true) {
          return Right(SupervisorGetAllEmployeesAttendanceValue.fromJson(
              result['value']));
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
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetEarlyLeavers({required String day}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.getEmployeeAttendance}/earlyLeavers/$day");
        if (result['isSuccess'] == true) {
          return Right(SupervisorGetAllEmployeesAttendanceValue.fromJson(
              result['value']));
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
  Future<Either<Failure, void>> setPlanByDate(
      SetPlanByDateRequestBody setPlanByDateRequestBody) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Plan,
            body: setPlanByDateRequestBody.toJson());
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, GetPlanByIdValue>> getPlanById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiservice.get(endPoint: "${ApiConstant.Plan}/$id");
        if (result['isSuccess'] == true) {
          return Right(GetPlanByIdValue.fromJson(result['value']));
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
  Future<Either<Failure, void>> setSubPlan(
      {required setSubPlansRequestBody setSubPlansRequestBody}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Plan + "/" + ApiConstant.plan,
            body: setSubPlansRequestBody.toJson());
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, PlanValue>> getPlanByDepartmentId() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.Plan}/department/${ApiConstant.departmentId}");
        if (result['isSuccess'] == true) {
          return Right(
            PlanValue.fromJson(result['value']),
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
  Future<Either<Failure, void>> deletePlanById({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiservice.delete(endPoint: "${ApiConstant.Plan}/$id");
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, void>> deleteSubPlanById({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.delete(
            endPoint: ApiConstant.Plan + "/" + ApiConstant.plan + "?id=$id");
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, void>> addTask(
      {required AddTaskRequestBody addTaskRequestBody}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Task, body: addTaskRequestBody.toJson());
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure,  List<GetTasData>>> getAllTasksByDepartmentId(
      {required int pageNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.Task}/department/${ApiConstant.departmentId}");
        if (result['isSuccess'] == true) {
          return Right(
            List<GetTasData>.from((result['value'] as List).map((e) => GetTasData.fromJson(e))),
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
  Future<Either<Failure, void>> deleteTaskById({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiservice.delete(endPoint: "${ApiConstant.Task}?id=$id");
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, void>> assignTask(
      {required int taskId, required List<String> employeeIds}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: "${ApiConstant.Task}/assignTask",
            body: {"employeeIds": employeeIds, "taskId": taskId});
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, void>> changeTaskStatus(
      {required int taskId, required String status}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.put(
            endPoint: "${ApiConstant.Task}/updateStatus",
            body: {"id": taskId, "status": status});
        if (result['isSuccess'] == true) {
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
  Future<Either<Failure, GetCustomerByIdModel>> getCustomerById({required String CustomerId}) async{
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(endPoint: "${ApiConstant.addCustomer}/$CustomerId");
        if (result['isSuccess'] == true) {
          return Right(GetCustomerByIdModel.fromJson(result));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
