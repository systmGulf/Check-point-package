import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/employee_payslip_model/payslip_model.dart';

abstract class EmployeePayslipRepo {
  Future<Either<Failure, List<PayrollModel>>> getPayslipByEmployeeId(String id);
}
