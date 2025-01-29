import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../admin/data/models/branches/get_branches_models.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../supervisor/data/models/plan_model/get_plan_by_id_model.dart';
import '../../../../supervisor/data/models/plan_model/plan_feed_back_request_body.dart';
import '../../models/employee_leave_requests_models/track_user_request_body.dart';
import '../../models/user_attendace_model/employee_check_in_request_body.dart';
import '../../models/user_attendace_model/get_plan_by_employee_id_model.dart';
import '../../models/user_attendace_model/user_tracking_summary_response_model.dart';
import '../employee_data.dart';

abstract class EmployeeAttendanceRepo {
  Future<Either<Failure, UserAttendanceModel>> employeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody);
  Future<Either<Failure, UserAttendanceModel>> employeeCheckOut({
    required String employeeId,
  });
    Future<Either<Failure, void>> trackEmployeeLocation({required TrackUserRequestBody trackUserRequestBody});
  
  Future<Either<Failure, UserAttendanceValue>> getAllEmployeeAttendance(
      {int pageNumber = 0});
  Future<Either<Failure, GetPlanByEmployeeIdValue>>
      getCustomerPlanForEmployee();
  Future<Either<Failure, GetPlanByIdValue>> getPlanById({required int id});

  Future<bool> checkAccessibleAreaForPloygon(
    LatLng pointLatNong,
    List<LatLng> area,
  );
  double checkAccessibleAreaForCircle(
      LatLng customerLocation, LatLng currentUserLocation);
  Future<Either<Failure, GetBranchesData>> getBranchesById();
  // feedback for attendace in customer or site
  Future<Either<Failure, void>> addPlanFeedBack(
      {required PlanFeedBackRequestBody planFeedBackRequestBody});
}
