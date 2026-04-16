class ApiConstant {
  static String token = "";
  static String username = '';
  static String employeeId = '';
  static String departmentId = '';
  static String branchId = '';
  static String position = '';
  static String employeeCheckinTime = '';
  static String employeeCheckoutTime = '';
  static String imageUrl = '';
  static String shiftName = '';
  static String area = 'Customer';
  static const String login = "api/Authentication/login";
  static const String uploadUserImage = "employeeImage";
  static const String updateUserToken = "Auth/updateDeviceToken";
  static const successApiKey = 'isSuccess';
  static const singleNotification = 'sendSingle';
  static const multiNotification = 'sendMulti';

  static const String employee = "Employee";
  static const String employeeCheckIn = 'api/AttendanceRecord';
  static const String employeeCheckOut = 'api/AttendanceRecord';
  static const String getEmployeeAttendanceHistory = 'Attendance/employeeId';
  static const String leaveRequest = 'LeaveRequest';
  static const String getAllLeaveRequestsForEmployee = 'LeaveRequest/employee';
  static const String getEmployeeAttendance = 'Attendance';
  static const String employeeChangePassword = 'Auth/ChangePassword';
  static const String deleteEmployee = 'Auth/DeleteUser';
  static const String department = 'Department';
  static const String removeTaskFromEmployee = "Employee/removeAssignTask";
  static const String addCustomer = 'Customer';
  static const String customerplan = 'customerPlan';
  static const String branches = 'Branch';
  static const String accountRequest = 'AccountRequest';
  static const String plan = 'Plan';
  static const String Task = 'Task';
  static const String Shift = 'Shift';
  static const String Notification = 'Notification';
  static const String Policy = 'Policy';
  static const String trackEmployeeLocation = 'Employee/trackEmployee';
  static const String planFeedback = 'Feedback';
  static const String getTrackingSummaryForEmployee =
      'Employee/getEmployeeTracking';
  static const String removeAsignPolicy = "Employee/removeAssignPolicy";
  static const String removeAsignCustomerPlan =
      "Employee/removeAssignCustomerPlan";
  static const String feedBackStatus = "Feedback/feedbackStatus";
}
