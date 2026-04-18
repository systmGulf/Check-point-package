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
  static const String employeeCheckIn = 'api/AttendeesRecord';
  static String employeeCheckOut(String attendanceId) =>
      'api/AttendeesRecord/$attendanceId';
  static const String getEmployeeAttendanceHistory =
      'api/Announcement/employee/';
  static const String leaveRequest = 'api/LeaveRequest/all';
  static const String getAllLeaveRequestsForEmployee = 'LeaveRequest/employee';
  static const String getEmployeeAttendance = 'api/AttendeesRecord/all';
  static const String employeeChangePassword = 'Auth/ChangePassword';
  static const String deleteEmployee = 'Auth/DeleteUser';
  static const String department = 'Department';
  static const String removeTaskFromEmployee = "Employee/removeAssignTask";
  static const String addCustomer = 'Customer';
  static const String customerplan = 'customerPlan';
  static const String branches = 'Branch';

  static const String accountRequest = 'AccountRequest';
  static const String plan = 'Plan';
  static const String Task = 'api/Task';
  static const String employeeTask = 'api/EmployeeTask';
  static const String apiEmployee = 'api/Employee';
  static const String announcement = 'api/Announcement';
  static const String news = 'api/News';
  static const String companyEvent = 'api/CompanyEvent';
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

  // new
  static const String leaveType = "api/LeaveType/all";
  static String getComplaints(String employeeId) =>
      'api/Complaint/employee/$employeeId';

  static const String complaints = "/api/Complaint";
  //! PaySlip
  static String payslip(String id) => "api/Payslip/$id";
}
