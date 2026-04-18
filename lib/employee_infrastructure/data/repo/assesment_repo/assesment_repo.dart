import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/employee_assesment_model/assesment_input_model/assesment_input_model.dart';
import '../../models/employee_assesment_model/assesment_model.dart';

abstract class AssesmentRepo {
  Future<Either<Failure, List<EmployeeAssessmentModel>>> getAssesments();

  Future<Either<Failure, EmployeeAssessmentModel>> getAssesmentsById(
      String employeeId, String assesmentId);
  Future<Either<Failure, EmployeeAssessmentModel>> submit(
      AssesmentInputModel input);
}
