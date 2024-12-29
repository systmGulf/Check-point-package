import 'package:dartz/dartz.dart';
import '../../../../supervisor/data/models/task_model/get_task_response.dart';
import '../../../../hr_manamgement_system_package.dart';

abstract class EmployeeRepo {
  Future<Either<Failure, UserAttendanceModel>> createLeaveRequest(
      LeaveRequestRequestBody leaveRequestRequestBody);
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getAllLeaveRequestsForEmployee();
  Future<Either<Failure, EmployeeLeaveRequestsValue>>
      getLeaveRequestsByTypeForEmployee({required String type});
  Future<Either<Failure, void>> employeeChangePassword(
      ChangePasswordRequestBody changePasswordRequestBody);
  Future<Either<Failure, void>> deleteLeaveRequest({required int id});
  Future<Either<Failure, GetAllEmployeesValue>>
      getEmployeeByDepartmentId();
  Future<Either<Failure, List<GetTasData>>> getMyTasks();     
  Future<Either<Failure, void>> changeTaskStatus(
    {required int taskId, required String status}
  );
}
