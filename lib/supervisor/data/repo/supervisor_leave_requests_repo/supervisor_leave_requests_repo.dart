import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../supervisor_data.dart';

abstract class SupervisorLeaveRequestsRepo {
  // Supervisor Get Employee Leave Request
    Future<Either<Failure, List<GetLeaveRequestModel>>>
      supervisorGetEmployeeLeaveRequest();
  // Approve or reject leave request
   Future<Either<Failure, void>> approveOrRejectLeaveRequest(
      {required String status, required int id});
      // Get leave requests by type
  Future<Either<Failure, GetLeaveRequestModel>>
      getLeaveRequestsByTypeForDepartment({
    required String type,
  });
}