import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/get_leave_Request_model/change_request_leave_status.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/get_leave_Request_model/get_leave_request_model.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/get_leave_Request_model/get_leave_type_model.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../../supervisor_data.dart';
import 'supervisor_leave_requests_repo.dart';

class SupervisorLeaveRequestsRepoImpl implements SupervisorLeaveRequestsRepo {
  final ApiService apiservice;

  SupervisorLeaveRequestsRepoImpl({
    required this.apiservice,
  });

  @override
  // approve Or Reject LeaveRequest
  Future<Either<Failure, void>> approveOrRejectLeaveRequest(
      {required ChangeRequestLeaveStatus body}) async {
    try {
      final result = await apiservice.put(
        endPoint: "${ApiConstant.leaveRequest}/leaveRequestStatus",
        body: body.toJson(),
      );
      if (result is Map<String, dynamic> &&
          result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else if (result is Map<String, dynamic>) {
        return Left(Failure(404, getResponseError(result)));
      } else {
        return Left(Failure(500, 'Unexpected server response'));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // get LeaveRequests By Type (for supervisor we fetch all then filter in cubit)
  Future<Either<Failure, GetLeaveRequestModel>>
      getLeaveRequestsByTypeForDepartment({required String type}) async {
    try {
      const allEndpoint = '${ApiConstant.leaveRequest}/all';
      const fallbackEndpoint = ApiConstant.leaveRequest;

      late dynamic result;
      try {
        result = await apiservice.get(endPoint: allEndpoint);
      } on Exception {
        // Backward compatibility with older backends.
        result = await apiservice.get(endPoint: fallbackEndpoint);
      }

      if (result is Map<String, dynamic> &&
          result[ApiConstant.successApiKey] == true) {
        return Right(GetLeaveRequestModel.fromJson(result));
      } else if (result is Map<String, dynamic>) {
        return Left(Failure(404, getResponseError(result)));
      } else {
        return Left(Failure(500, 'Unexpected server response'));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // get LeaveRequests
  Future<Either<Failure, List<GetLeaveRequestModel>>>
      supervisorGetEmployeeLeaveRequest() async {
    try {
      final result = await apiservice.get(endPoint: ApiConstant.leaveRequest);
      if (result is Map<String, dynamic> &&
          result[ApiConstant.successApiKey] == true) {
        return Right((result['value'] as List)
            .map((e) => GetLeaveRequestModel.fromJson(e))
            .toList());
      } else if (result is Map<String, dynamic>) {
        return Left(Failure(404, getResponseError(result)));
      } else {
        return Left(Failure(500, 'Unexpected server response'));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, GetLeaveTypeModel>> getLeaveType() async {
    try {
      final result = await apiservice.get(endPoint: ApiConstant.leaveType);
      if (result is Map<String, dynamic> &&
          result[ApiConstant.successApiKey] == true) {
        return Right(GetLeaveTypeModel.fromJson(result));
      } else if (result is Map<String, dynamic>) {
        return Left(Failure(404, getResponseError(result)));
      } else {
        return Left(Failure(500, 'Unexpected server response'));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
