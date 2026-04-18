import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_payslip_model/payslip_model.dart';

import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import 'employee_payslip_repo.dart';

class EmployeePayslipRepoImpl implements EmployeePayslipRepo {
  final ApiService apiService;

  EmployeePayslipRepoImpl({required ApiService apiService})
      : apiService = apiService;
  @override
  Future<Either<Failure, List<PayrollModel>>> getPayslipByEmployeeId(
    String id,
  ) async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.payslip(id));
      if (result[ApiConstant.successApiKey] == true) {
        final payslips = (result['value'] as List)
            .map((e) => PayrollModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(payslips);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
