import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_management_system_package/employee/data/models/employee_leave_requests_models/track_user_request_body.dart';
import 'package:hr_management_system_package/employee/data/models/user_attendace_model/user_tracking_summary_response_model.dart';

import '../../../../admin/data/models/branches/get_branches_models.dart';
import '../../../../core/core.dart';
import '../../../../core/networking/check_accessiable_area_service.dart';
import '../../../../supervisor/data/models/plan_model/get_plan_by_id_model.dart';
import '../../../../supervisor/data/models/plan_model/plan_feed_back_request_body.dart';
import '../../models/user_attendace_model/employee_check_in_request_body.dart';
import '../../models/user_attendace_model/get_plan_by_employee_id_model.dart';
import '../../models/user_attendace_model/user_attendace_model.dart';
import 'employee_attendance_repo.dart';

class EmployeeAttendanceRepoImpl implements EmployeeAttendanceRepo {
  final ApiService apiservice;
  final CheckAccessibleAreaService checkAccessibleAreaService;

  EmployeeAttendanceRepoImpl(this.checkAccessibleAreaService,
      {required this.apiservice});

  @override
  Future<Either<Failure, GetBranchesData>> getBranchesById() async {
   try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.branches}/${ApiConstant.branchId}");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetBranchesData.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  Future<Either<Failure, GetPlanByEmployeeIdValue>>
      getCustomerPlanForEmployee() async {
  try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.Plan}/employee/${ApiConstant.employeeId}");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetPlanByEmployeeIdValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  // CHECK IN
  @override
  double checkAccessibleAreaForCircle(
      LatLng customerLocation, LatLng currentUserLocation) {
    return checkAccessibleAreaService.checkAccessibleAreaForCircle(
        customerLocation, currentUserLocation);
  }

  @override
  Future<Either<Failure, UserAttendanceModel>> employeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody) async {
    try {
        final result = await apiservice.post(
            endPoint: ApiConstant.employeeCheckIn,
            body: employeeCheckInRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return Right(UserAttendanceModel.fromJson(result));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  // CHECK OUT
  @override
  Future<Either<Failure, UserAttendanceModel>> employeeCheckOut(
      {required String employeeId}) async {
  try {
        final result = await apiservice.post(
            endPoint: "${ApiConstant.employeeCheckOut}",
            body: {"employeeId": employeeId, "employeeImage": null});
        if (result[ApiConstant.successApiKey] == true) {
          return Right(UserAttendanceModel.fromJson(result));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  Future<Either<Failure, UserAttendanceValue>> getAllEmployeeAttendance(
      {int pageNumber = 0}) async {
  try {
        final result = await apiservice.get(
          endPoint:
              "${ApiConstant.getEmployeeAttendanceHistory}/${ApiConstant.employeeId}?itemCount=10&index=${pageNumber * 10}",
        );
        if (result[ApiConstant.successApiKey] == true) {
          return Right(UserAttendanceValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  Future<Either<Failure, GetPlanByIdValue>> getPlanById(
      {required int id}) async {
   try {
        final result =
            await apiservice.get(endPoint: "${ApiConstant.Plan}/$id");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetPlanByIdValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  Future<bool> checkAccessibleAreaForPloygon(
      LatLng pointLatNong, List<LatLng> area) async {
  return await checkAccessibleAreaService.checkAccessibleAreaForPloygon(
          pointLatNong, area);
  }
   @override
  Future<Either<Failure, void>> addPlanFeedBack({required PlanFeedBackRequestBody planFeedBackRequestBody}) async {
   try {
        final result = await apiservice.post(
            endPoint: ApiConstant.planFeedback, body: planFeedBackRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  Future<Either<Failure, void>> trackEmployeeLocation({required TrackUserRequestBody trackUserRequestBody}) async{
   try {
        final result = await apiservice.post(
            endPoint: ApiConstant.trackEmployeeLocation, body: trackUserRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }


    }
  