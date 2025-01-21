import 'package:get_it/get_it.dart';
import 'package:hr_management_system_package/core/notifications/notification_repo.dart';
import 'package:hr_management_system_package/core/notifications/notifications_repo_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../admin/data/repo/shifts_and_polices_repo/shifts_and _polices_repo_impl.dart';
import '../../admin/data/repo/shifts_and_polices_repo/shifts_and_polices_repo.dart';
import '../../employee/data/repo/employee_attendance_repo/employee_attendance_repo.dart';
import '../../employee/data/repo/employee_attendance_repo/employee_attendance_repo_impl.dart';
import '../../hr_manamgement_system_package.dart';
import '../../register_account/repo/register_account_repo.dart';
import '../../register_account/repo/register_account_repo_impl.dart';
import '../errors/internet_checker.dart';
import '../networking/check_accessiable_area_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio: DioFactory.getDio()),
  );
  getIt.registerLazySingleton<RegisterAccountRepo>(
    () => RegisterAccountRepoImpl(
      apiService: getIt<ApiService>(),
      getIt<NetworkInfo>(),
    ),
  );
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: getIt<InternetConnectionChecker>(),
    ),
  );
  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationsRepoImpl(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      apiservice: getIt<ApiService>(),
      getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<ShiftsAndPolicesRepo>(
    ShiftsAndPolicesRepoImpl(
      apiService: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<SupervisorRepo>(
    SupervisorRepoImpl(
      apiservice: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<CheckAccessibleAreaService>(
    CheckAccessibleAreaService(),
  );
  getIt.registerSingleton<EmployeeAttendanceRepo>(EmployeeAttendanceRepoImpl(
      getIt<CheckAccessibleAreaService>(),
      apiservice: getIt<ApiService>(),
      getIt<NetworkInfo>()));
  getIt.registerSingleton<EmployeeRepo>(
    EmployeeRepoImpl(
      apiservice: getIt<ApiService>(),
      getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<BranchesRepo>(
    AdminRepoImpl(
      apiService: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<CustomerRepo>(
    CustomerRepoImpl(
      apiService: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<DepartmentRepo>(
    DepartmentRepoImpl(
      apiService: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerSingleton<AdminManageEmployeeRepo>(
    AdminManageEmployeeRepoImpl(
      apiService: getIt<ApiService>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
}
