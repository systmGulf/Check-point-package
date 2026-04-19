import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';

import '../../models/employee_benefit_model/create_employee_benefit_request_body.dart';
import '../../models/employee_benefit_model/create_employee_benefit_response.dart';
import '../../models/employee_benefit_model/employee_benefits_response.dart';

abstract class EmployeeBenefitRepo {
  Future<Either<Failure, EmployeeBenefitsResponse>> getAllBenefits();

  Future<Either<Failure, CreateEmployeeBenefitResponse>>
      createEmployeeBenefitRequest(
    CreateEmployeeBenefitRequestBody requestBody,
  );
}
