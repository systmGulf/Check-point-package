import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_management_system_package/employee_infrastructure/data/models/employee_attendace_model/track_user_request_body.dart';

import '../../../../admin/data/models/branches/get_branches_models.dart';
import '../../../../core/core.dart';
import '../../../../core/common_methods/check_accessiable_area_service.dart';
import '../../../../supervisor/data/models/plan_model/get_plan_by_id_model.dart';
import '../../../../supervisor/data/models/plan_model/plan_feed_back_request_body.dart';
import '../../models/employee_attendace_model/employee_check_in_request_body.dart';
import '../../models/employee_attendace_model/get_plan_by_employee_id_model.dart';
import '../../models/employee_attendace_model/user_attendace_model.dart';
import 'employee_attendance_repo.dart';

class EmployeeAttendanceRepoImpl implements EmployeeAttendanceRepo {
  final ApiService apiservice;
  final CheckAccessibleAreaService checkAccessibleAreaService;

  EmployeeAttendanceRepoImpl(this.checkAccessibleAreaService,
      {required this.apiservice});

  @override
  // Get Branch By Id for the User
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
  // Get Customer Plan For Employee
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

  // check if the user in the right zoon for an Customer
  @override
  double checkAccessibleAreaForCircle(
      LatLng customerLocation, LatLng currentUserLocation) {
    return checkAccessibleAreaService.checkAccessibleAreaForCircle(
        customerLocation, currentUserLocation);
  }

  @override
  //  Employee Check in
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

  // employee check out
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
  // get all employee attendance
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
  // get plan by id
  Future<Either<Failure, GetPlanByIdValue>> getPlanById(
      {required int id}) async {
    try {
      final result = await apiservice.get(endPoint: "${ApiConstant.Plan}/$id");
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
  // check if the user in the right zoon for site
  Future<bool> checkAccessibleAreaForPolygon(
      LatLng pointLatNong, List<LatLng> area) async {
    return await checkAccessibleAreaService.checkAccessibleAreaForPolygon(
        pointLatNong, area);
  }

  @override
  // add feed back for an customer or site plan
  Future<Either<Failure, void>> addPlanFeedBack(
      {required PlanFeedBackRequestBody planFeedBackRequestBody}) async {
    try {
      final result = await apiservice.post(
          endPoint: ApiConstant.planFeedback,
          body: planFeedBackRequestBody.toJson());
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
  // track employee location in the background
  Future<Either<Failure, void>> trackEmployeeLocation(
      {required TrackUserRequestBody trackUserRequestBody}) async {
    try {
      final result = await apiservice.post(
          endPoint: ApiConstant.trackEmployeeLocation,
          body: trackUserRequestBody.toJson());
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
