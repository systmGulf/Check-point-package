import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/internet_checker.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../models/add_employee_model/add_account_request_model.dart';
import '../../models/add_employee_model/add_employee_request_body.dart';
import '../../models/all_employees_model/all_employees_model.dart';
import '../../models/all_employees_model/edit_employee_request_body.dart';
import '../../models/department_model/get_employees_in_department.dart';
import 'admin_manage_employee_repo.dart';

class AdminManageEmployeeRepoImpl implements AdminManageEmployeeRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  AdminManageEmployeeRepoImpl(
      {required this.apiService, required this.networkInfo});

  @override
  Future<Either<Failure, void>> addEmployee(
      AddEmployeeRequestBody request) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.post(
            endPoint: ApiConstant.employee, body: request.toJson());
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
  Future<Either<Failure, void>> deleteUserAccount(
      {required String userId}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.delete(
            endPoint: "${ApiConstant.deleteEmployee}/$userId");
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
  Future<Either<Failure, void>> editEmployee(
      EditEmployeeRequestBody requestBody,
      {required String id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.put(
            endPoint: "${ApiConstant.employee}/$id",
            body: requestBody.toJson());
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
  Future<Either<Failure, GetAllEmployeesValue>> getAllEmployees(
      {required int pageNumber}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.get(
            endPoint:
                "${ApiConstant.employee}?itemCount=10&index=${pageNumber * 10}");
        if (result[ApiConstant.successApiKey] == true) {
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
  Future<Either<Failure, GetEmployeesInDepartmentValue>>
      GetEmployeesInDepartment({required int id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.get(
            endPoint: "${ApiConstant.employee}/departmentId/$id");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetEmployeesInDepartmentValue.fromJson(result['value']));
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
  Future<Either<Failure, void>> attendAntherUserPermission(
      {required String supervisorId, required bool permission}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.post(
            endPoint:
                "${ApiConstant.employee}/employeeId/$supervisorId/attendancePermission/$permission",
            body: {});
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
  Future<Either<Failure, void>> setPlanPermission(
      {required bool permission, required String supervisorId}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.post(
            endPoint:
                "${ApiConstant.employee}/employeeId/$supervisorId/planPermission/$permission",
            body: {});
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
  Future<Either<Failure, AddAccountRequestValue>>
      getAddAccountsRequests() async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result =
            await apiService.get(endPoint: ApiConstant.accountRequest);

        if (result[ApiConstant.successApiKey] == true) {
          return Right(AddAccountRequestValue.fromJson(result['value']));
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
  Future<Either<Failure, void>> deleteAddAccountsRequest(
      {required int id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.delete(
            endPoint: "${ApiConstant.accountRequest}?id=$id");
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
