import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/employee_model/add_account_request_model.dart';
import '../../models/employee_model/add_employee_request_body.dart';
import '../../models/employee_model/all_employees_model.dart';
import '../../models/employee_model/edit_employee_request_body.dart';
import '../../models/department_model/get_employees_in_department.dart';

abstract class AdminManageEmployeeRepo {
  // get all employees
  Future<Either<Failure, GetAllEmployeesValue>> getAllEmployees(
      {required int pageNumber});
  // add employee
  Future<Either<Failure, void>> addEmployee(AddEmployeeRequestBody request);
  //  Delete employee Account
  Future<Either<Failure, void>> deleteEmployeeAccount({required String userId});
// Edit employee
  Future<Either<Failure, void>> editEmployee(
      EditEmployeeRequestBody requestBody,
      {required String id});
  // get employees in department
  Future<Either<Failure, GetEmployeesInDepartmentValue>>
      GetEmployeesInDepartment({required int id});

  /// THIS IS PERMISSIONS FOR SUPERVISOR THAT HE CAN ATTEND SOME ONE ELSE OR SET PLAN PERMISSION
  // set attend anther user permission
  Future<Either<Failure, void>> attendAntherUserPermission(
      {required String supervisorId, required bool permission});
  // set plan permission
  Future<Either<Failure, void>> setPlanPermission(
      {required bool permission, required String supervisorId});
  // when the user request to add account for his this account go to admin
  Future<Either<Failure, AddAccountRequestValue>>
      getAddAccountRequestsForAdmin();
  // delete add account request
  Future<Either<Failure, void>> deleteAddAccountRequestsForAdmin(
      {required int id});
}
