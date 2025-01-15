class ApiConstant {
  static String token = "";
  static String username = '';
  static String employeeId = '';
  static String departmentId = '';
  static String branchId = '';
  static String position = '';
  static String area = 'Customer';
  static const String login = "Auth/Login";
  static const String updateUserToken = "Auth/updateDeviceToken";

  static const String employee = "Employee";
  static const String employeeCheckIn = 'Attendance/in';
  static const String employeeCheckOut = 'Attendance/out';
  static const String getEmployeeAttendanceHistory = 'Attendance/employeeId';
  static const String leaveRequest = 'LeaveRequest';
  static const String getAllLeaveRequestsForEmployee =
      'LeaveRequest/employeeId';
  static const String getEmployeeAttendance = 'Attendance';
  static const String employeeChangePassword = 'Auth/ChangePassword';
  static const String deleteEmployee = 'Auth/DeleteUser';
  static const String department = 'Department';

  static const String addCustomer = 'Customer';
  static const String plan = 'customerPlan';
  static const String branches = 'Branch';
  static const String accountRequest = 'AccountRequest';
  static const String Plan = 'Plan';
  static const String Task = 'Task';
  static const String Shift = 'Shift';
  static const String Notification = 'Notification';
  static const String Policy = 'Policy';
  static const String planFeedback = 'Feedback';
}
