import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';

import '../../models/employee_allowance_model/beneficiary_allowances_response.dart';
import '../../models/employee_allowance_model/all_allowances_response.dart';
import '../../models/employee_allowance_model/assign_allowance_to_employee_models.dart';
import '../../models/employee_allowance_model/request_allowance_request_body.dart';

abstract class EmployeeAllowanceRepo {
  Future<Either<Failure, AllAllowancesResponse>> getAllAllowances();

  Future<Either<Failure, BeneficiaryAllowancesResponse>>
      getBeneficiaryAllowances({String? employeeId});

  Future<Either<Failure, AllowanceRequestResponse>> requestAllowance(
    RequestAllowanceRequestBody requestBody,
  );

  Future<Either<Failure, AssignAllowanceToEmployeeResponse>>
      assignAllowanceToEmployee(
    AssignAllowanceToEmployeeRequestBody requestBody,
  );
}
