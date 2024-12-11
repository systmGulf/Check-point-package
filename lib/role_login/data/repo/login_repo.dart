import 'package:dartz/dartz.dart';
import '../model/employee_login_model/role_login_model.dart';
import '../../../hr_manamgement_system_package.dart';
import '../model/employee_login_model/role_login_request_body.dart';

abstract class LoginRepo {
  Future<Either<Failure, RoleLoginModel>> roleLogin(
      RoleLoginRequestBody roleLoginRequestBody);
  Future<Either<Failure, EmployeeData>> getEmployeeById();
}
