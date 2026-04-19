import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/add_employee_skill_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_beneficiary_benefits_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/employee_profile_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/skill_catalog_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/update_employee_profile_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/employee_profile_model/user_skills_response.dart';

import '../../../../core/errors/error_handler.dart';

abstract class EmployeeSummaryRepo {
  Future<Either<Failure, EmployeeProfileValue>> getEmployeeProfile({
    required String employeeId,
  });
  Future<Either<Failure, List<UserSkillItem>>> getUserSkills({
    required String employeeId,
  });
  Future<Either<Failure, List<SkillCatalogItem>>> getAllSkills();
  Future<Either<Failure, UserSkillItem>> addUserSkill({
    required AddEmployeeSkillRequestBody body,
  });
  Future<Either<Failure, List<EmployeeBeneficiaryBenefitItem>>>
      getBeneficiaryBenefits({
    required String employeeId,
  });
  Future<Either<Failure, void>> updateEmployeeProfile({
    required String employeeId,
    required UpdateEmployeeProfileRequestBody body,
  });
}
