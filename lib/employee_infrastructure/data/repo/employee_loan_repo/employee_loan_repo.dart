import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';

import '../../models/employee_loan_model/create_loan_request_body.dart';
import '../../models/employee_loan_model/create_loan_request_response.dart';
import '../../models/employee_loan_model/employee_loans_response.dart';
import '../../models/employee_loan_model/installement_types_response.dart';

abstract class EmployeeLoanRepo {
  Future<Either<Failure, EmployeeLoansResponse>> getAllLoans();
  Future<Either<Failure, InstallementTypesResponse>> getInstallementTypes();
  Future<Either<Failure, CreateLoanRequestResponse>> createLoanRequest(
      CreateLoanRequestBody requestBody);
}
