import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_profile_response.dart';

import '../../../../core/errors/error_handler.dart';

abstract class EmployeeSummaryRepo {
  Future<Either<Failure, EmployeeProfileValue>> getEmployeeProfile({
    required String employeeId,
  });
}
