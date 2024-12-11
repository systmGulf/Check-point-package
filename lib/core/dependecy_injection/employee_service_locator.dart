import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../admin/data/repo/customer_repo/customer_repo.dart';
import '../../admin/data/repo/customer_repo/customer_repo_impl.dart';
import '../../admin/data/repo/department_repo/department_repo.dart';
import '../../admin/data/repo/department_repo/department_repo_impl.dart';
import '../../admin/data/repo/employee_repo/admin_manage_employee_repo.dart';
import '../../admin/data/repo/employee_repo/admin_manage_employee_repo_impl.dart';
import '../../employee/data/repo/attendance_repo/employee_attendance_repo.dart';
import '../../employee/data/repo/attendance_repo/employee_attendance_repo_impl.dart';
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
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      apiservice: getIt<ApiService>(),
      getIt<NetworkInfo>(),
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
