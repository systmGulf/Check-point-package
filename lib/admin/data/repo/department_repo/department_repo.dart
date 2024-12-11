import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/department_model/department_model.dart';

abstract class DepartmentRepo {
  Future<Either<Failure, void>> addDepartment({required String departmentName});
  Future<Either<Failure, void>> deleteDepartment({required int id});
  Future<Either<Failure, DepartmentValue>> getAllDepartments();
  Future<Either<Failure, DepartmentValue>> searchDepartments(
      {required String searchKey});
  Future<Either<Failure, void>> editDepartment(
      {required int id, required String departmentName});
}
