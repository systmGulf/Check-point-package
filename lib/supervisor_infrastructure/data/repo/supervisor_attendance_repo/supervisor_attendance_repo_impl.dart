import 'package:dartz/dartz.dart';

import '../../../../admin_infrastructure/data/models/employee_model/all_employees_model.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../employee_infrastructure/data/models/employee_attendance_model/employee_check_in_request_body.dart';
import '../../../../employee_infrastructure/data/models/employee_attendance_model/user_tracking_summary_response_model.dart';
import '../../models/customers_model/get_customer_by_id_model.dart';
import '../../models/employee_summary_model/employee_summary_model.dart';
import '../../models/employees_attendance_model/get_employee_attendance.dart';
import 'supervisor_attendance_repo.dart';

class SupervisorAttendanceRepoImpl implements SupervisorAttendanceRepo {
  final ApiService apiService;

  SupervisorAttendanceRepoImpl({
    required this.apiService,
  });
  @override
  // Get all employees attendance
  Future<Either<Failure, List<SupervisorGetAllEmployeesAttendanceModel>>>
      supervisorGetAllEmployeesAttendance() async {
    try {
      final result =
          await apiService.get(endPoint: ApiConstant.getEmployeeAttendance);
      if (result[ApiConstant.successApiKey] == true) {
        return Right((result['value'] as List)
            .map((e) => SupervisorGetAllEmployeesAttendanceModel.fromJson(e))
            .toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get employee attendance by department
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      getEmployeeAttendanceByDepartmentId(
          {required String attendanceDate}) async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.getEmployeeAttendance}/departmentId/${ApiConstant.departmentId}?attendenceDate=$attendanceDate");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(
            SupervisorGetAllEmployeesAttendanceValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get employee by department
  Future<Either<Failure, GetAllEmployeesValue>>
      getEmployeeByDepartmentId() async {
    try {
      final result = await apiService.get(endPoint: "api/Employee/all");
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'];
        if (value is List) {
          final employees = value
              .whereType<Map<String, dynamic>>()
              .map((e) {
                final personalInfo =
                    (e['personalInfo'] as Map<String, dynamic>?) ?? {};
                final employeeSpecification =
                    (e['employeeSpecification'] as Map<String, dynamic>?) ?? {};

                final firstName =
                    (personalInfo['firstName'] ?? '').toString().trim();
                final lastName =
                    (personalInfo['lastName'] ?? '').toString().trim();
                final fullName = '$firstName $lastName'
                    .trim()
                    .replaceAll(RegExp(r'\s+'), ' ');

                return EmployeeData(
                  id: e['id']?.toString(),
                  name: fullName.isNotEmpty ? fullName : firstName,
                  userName:
                      (e['code'] ?? personalInfo['firstName'] ?? '').toString(),
                  position: employeeSpecification['jobTitle']?.toString(),
                  departmentName:
                      employeeSpecification['organizationUnitName']?.toString(),
                  imageUrl: null,
                  deviceTokens: const <String>[],
                );
              })
              .toList();

          return Right(
            GetAllEmployeesValue(
              data: employees,
              totalCount: employees.length,
              pageCount: 1,
              hasNextPage: false,
              hasPreviousPage: false,
              start: employees.isEmpty ? 0 : 1,
              end: employees.length,
            ),
          );
        }
        if (value is Map<String, dynamic>) {
          return Right(GetAllEmployeesValue.fromJson(value));
        }
        return Right(GetAllEmployeesValue(data: const []));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get all employees
  Future<Either<Failure, List<GetAllEmployeesValue>>> getAllEmployees() async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.employee);
      if (result[ApiConstant.successApiKey] == true) {
        return Right((result['value'] as List)
            .map((e) => GetAllEmployeesValue.fromJson(e))
            .toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Attend some employee
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody) async {
    try {
      if (employeeCheckInRequestBody.employeeImage != null) {
        final result = await apiService.post(
            endPoint: ApiConstant.employeeCheckIn,
            body: employeeCheckInRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
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
  }

  @override
  // Attend some employee
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckOut(
      String employeeId, String? employeeImage) async {
    try {
      if (employeeImage != null) {
        final result = await apiService.post(
            endPoint: "${ApiConstant.employeeCheckOut}",
            body: {"employeeId": employeeId, "employeeImage": employeeImage});
        if (result[ApiConstant.successApiKey] == true) {
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
  }

  @override
  // Get employee summary
  Future<Either<Failure, EmployeeSummaryValue>> getEmployeeSummary(
      {required String employeeId,
      required int month,
      required int year}) async {
    try {
      final result = await apiService.get(
          body: {"employeeId": employeeId, "month": month, "year": year},
          endPoint: "${ApiConstant.getEmployeeAttendance}/attendanceSummary");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeSummaryValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get late comers
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetLateComers({required String day}) async {
    try {
      final result = await apiService.get(
          endPoint: "${ApiConstant.getEmployeeAttendance}/lateComers/$day");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(
            SupervisorGetAllEmployeesAttendanceValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get early leavers
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetEarlyLeavers({required String day}) async {
    try {
      final result = await apiService.get(
          endPoint: "${ApiConstant.getEmployeeAttendance}/earlyLeavers/$day");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(
            SupervisorGetAllEmployeesAttendanceValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get customer by id
  Future<Either<Failure, GetCustomerByIdModel>> getCustomerById(
      {required String CustomerId}) async {
    try {
      final result = await apiService.get(
          endPoint: "${ApiConstant.addCustomer}/$CustomerId");
      if (result['isSuccess'] == true) {
        return Right(GetCustomerByIdModel.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get customer by id
  Future<Either<Failure, UserTrackingSummaryResponseBody>>
      getTrackingSummaryForEmployee(
          {required String data, required String employeeId}) async {
    try {
      final result = await apiService.get(
          endPoint:
              "${ApiConstant.getTrackingSummaryForEmployee}?employeeId=${employeeId}&date=$data");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(UserTrackingSummaryResponseBody.fromJson(result));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
