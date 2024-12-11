import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/add_employee_model/add_account_request_model.dart';
import '../../models/add_employee_model/add_employee_request_body.dart';
import '../../models/all_employees_model/all_employees_model.dart';
import '../../models/all_employees_model/edit_employee_request_body.dart';
import '../../models/department_model/get_employees_in_department.dart';

abstract class AdminManageEmployeeRepo {
  Future<Either<Failure, GetAllEmployeesValue>> getAllEmployees(
      {required int pageNumber});
  Future<Either<Failure, void>> addEmployee(AddEmployeeRequestBody request);

  Future<Either<Failure, void>> deleteUserAccount({required String userId});

  Future<Either<Failure, void>> editEmployee(
      EditEmployeeRequestBody requestBody,
      {required String id});
  Future<Either<Failure, GetEmployeesInDepartmentValue>>
      GetEmployeesInDepartment({required int id});
  Future<Either<Failure, void>> attendAntherUserPermission(
      {required String supervisorId, required bool permission});
  Future<Either<Failure, void>> setPlanPermission(
      {required bool permission, required String supervisorId});
  Future<Either<Failure, AddAccountRequestValue>> getAddAccountsRequests();
  Future<Either<Failure, void>> deleteAddAccountsRequest({required int id});
}
