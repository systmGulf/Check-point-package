import 'package:dartz/dartz.dart';

import '../../../../core/errors/internet_checker.dart';
import '../../../../hr_manamgement_system_package.dart';
import 'supervisor_leave_requests_repo.dart';

class SupervisorLeaveRequestsRepoImpl implements SupervisorLeaveRequestsRepo {
  final ApiService apiservice;
  final NetworkInfo networkInfo;

  SupervisorLeaveRequestsRepoImpl(
      {required this.apiservice, required this.networkInfo});
  @override
  // approve Or Reject LeaveRequest
  Future<Either<Failure, void>> approveOrRejectLeaveRequest(
      {required String status, required int id}) async {
     final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.put(
            endPoint: "${ApiConstant.leaveRequest}/$id/status/$status",
            body: {});
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // get LeaveRequests By Type
  Future<Either<Failure, GetLeaveRequestModel>>
      getLeaveRequestsByTypeForDepartment({required String type}) async {
 final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.leaveRequest}/departmentId/${ApiConstant.departmentId}/leaveType/$type");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetLeaveRequestModel.fromJson(result));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  // get LeaveRequests
  Future<Either<Failure, List<GetLeaveRequestModel>>>
      supervisorGetEmployeeLeaveRequest() async {
    final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiservice.get(endPoint: ApiConstant.leaveRequest);
        if (result[ApiConstant.successApiKey] == true) {
          return Right((result['value'] as List)
              .map((e) => GetLeaveRequestModel.fromJson(e))
              .toList());
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
