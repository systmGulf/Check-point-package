import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_profile_response.dart';

import '../../../../hr_manamgement_system_package.dart';
import 'employee_summary_repo.dart';

class EmployeeSummaryRepoImpl implements EmployeeSummaryRepo {
  final ApiService apiService;

  EmployeeSummaryRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, EmployeeProfileValue>> getEmployeeProfile({
    required String employeeId,
  }) async {
    try {
      final result = await apiService.get(
        endPoint: "${ApiConstant.apiEmployee}/$employeeId",
      );
      if (result[ApiConstant.successApiKey] == true) {
        return Right(EmployeeProfileValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
