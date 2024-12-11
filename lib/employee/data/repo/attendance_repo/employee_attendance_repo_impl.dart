import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../admin/data/models/branches/get_branches_models.dart';
import '../../../../core/core.dart';
import '../../../../core/errors/internet_checker.dart';
import '../../../../core/networking/check_accessiable_area_service.dart';
import '../../../../supervisor/data/models/plan_model/get_plan_by_id_model.dart';
import '../../models/user_attendace_model/employee_check_in_request_body.dart';
import '../../models/user_attendace_model/get_plan_by_employee_id_model.dart';
import '../../models/user_attendace_model/user_attendace_model.dart';
import 'employee_attendance_repo.dart';

class EmployeeAttendanceRepoImpl implements EmployeeAttendanceRepo {
  final ApiService apiservice;
  final CheckAccessibleAreaService checkAccessibleAreaService;
  final NetworkInfo networkInfo;

  EmployeeAttendanceRepoImpl(this.checkAccessibleAreaService, this.networkInfo,
      {required this.apiservice});

  @override
  Future<Either<Failure, GetBranchesData>> getBranchesById() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.branches}/${ApiConstant.branchId}");
        if (result['isSuccess'] == true) {
          return Right(GetBranchesData.fromJson(result['value']));
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
  Future<Either<Failure, GetPlanByEmployeeIdValue>>
      getCustomerPlanForEmployee() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.Plan}/employee/${ApiConstant.employeeId}");
        if (result['isSuccess'] == true) {
          return Right(GetPlanByEmployeeIdValue.fromJson(result['value']));
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
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: ApiConstant.employeeCheckIn,
            body: employeeCheckInRequestBody.toJson());
        if (result['isSuccess'] == true) {
          return Right(UserAttendanceModel.fromJson(result));
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

  // CHECK OUT
  @override
  Future<Either<Failure, UserAttendanceModel>> employeeCheckOut(
      {required String employeeId}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.post(
            endPoint: "${ApiConstant.employeeCheckOut}",
            body: {"employeeId": employeeId, "employeeImage": null});
        if (result['isSuccess'] == true) {
          return Right(UserAttendanceModel.fromJson(result));
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
  Future<Either<Failure, UserAttendanceValue>> getAllEmployeeAttendance(
      {int pageNumber = 0}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiservice.get(
          endPoint:
              "${ApiConstant.getEmployeeAttendanceHistory}/${ApiConstant.employeeId}?itemCount=10&index=${pageNumber * 10}",
        );
        if (result['isSuccess'] == true) {
          return Right(UserAttendanceValue.fromJson(result['value']));
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
  Future<Either<Failure, GetPlanByIdValue>> getPlanById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiservice.get(endPoint: "${ApiConstant.Plan}/$id");
        if (result['isSuccess'] == true) {
          return Right(GetPlanByIdValue.fromJson(result['value']));
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
  Future<bool> checkAccessibleAreaForPloygon(
      LatLng pointLatNong, List<LatLng> area) async {
    if (await networkInfo.isConnected) {
      return await checkAccessibleAreaService.checkAccessibleAreaForPloygon(
          pointLatNong, area);
    } else {
      return false;
    }
  }
}
