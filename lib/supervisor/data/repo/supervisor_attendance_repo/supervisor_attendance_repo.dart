import 'package:dartz/dartz.dart';

import '../../../../admin/data/models/all_employees_model/all_employees_model.dart';
import '../../../../core/core.dart';
import '../../../../employee_infrastructure/data/models/employee_attendace_model/employee_check_in_request_body.dart';
import '../../../../employee_infrastructure/data/models/employee_attendace_model/user_tracking_summary_response_model.dart';
import '../../../supervisor_data.dart';
import '../../models/customers/get_customer_by_id_model.dart';
import '../../models/employee_summary_model/employee_summary_model.dart';
import '../../models/employees_attendance_model/get_employee_attendance.dart';

abstract class SupervisorAttendanceRepo {
  
      // Supervisor Get All Employees Attendance
  Future<Either<Failure, List<SupervisorGetAllEmployeesAttendanceModel>>>
      supervisorGetAllEmployeesAttendance();
  // Get Employee Attendance By Department Id
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      getEmployeeAttendanceByDepartmentId({required String attendanceDate});
      // Get All Employees in Department
  Future<Either<Failure, List<GetAllEmployeesValue>>> getAllEmployees();
  // Get Employee By Department Id
   Future<Either<Failure, GetAllEmployeesValue>> getEmployeeByDepartmentId();
  // Supervisor Attend Some Employee Check In
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckIn(
      EmployeeCheckInRequestBody employeeCheckInRequestBody);
      // Supervisor Attend Some Employee Check Out
  Future<Either<Failure, void>> supervisorAttendSomeEmployeeCheckOut(
      String EmployeeId, String? employeeImage);
      // Get Employee Summary
  Future<Either<Failure, EmployeeSummaryValue>> getEmployeeSummary(
      {required String employeeId, required int month, required int year});
      // Supervisor Get Late Comers
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetLateComers({required String day});
      // Supervisor Get Early Leavers
  Future<Either<Failure, SupervisorGetAllEmployeesAttendanceValue>>
      supervisorGetEarlyLeavers({required String day});
       Future<Either<Failure, GetCustomerByIdModel>> getCustomerById(
      {required String CustomerId});
       Future<Either<Failure, UserTrackingSummaryResponseBody>>
      getTrackingSummaryForEmployee(
          {required String data, required String employeeId});
}