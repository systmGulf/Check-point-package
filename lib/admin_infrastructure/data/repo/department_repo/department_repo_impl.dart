import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';

import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../models/department_model/department_model.dart';
import 'department_repo.dart';

class DepartmentRepoImpl implements DepartmentRepo {
  final ApiService apiService;

  DepartmentRepoImpl({
    required this.apiService,
  });

  @override
  // Add Department
  Future<Either<Failure, void>> addDepartment(
      {required String departmentName}) async {
    try {
      final result = await apiService.post(
          endPoint: ApiConstant.department,
          body: {"departmentName": departmentName});
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Delete Department
  Future<Either<Failure, void>> deleteDepartment({required int id}) async {
    try {
      final result =
          await apiService.delete(endPoint: "${ApiConstant.department}?id=$id");
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Get all Department
  Future<Either<Failure, DepartmentValue>> getAllDepartments() async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.department);
      if (result[ApiConstant.successApiKey] == true) {
        return Right(DepartmentValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Search Department
  Future<Either<Failure, DepartmentValue>> searchDepartments(
      {required String searchKey}) async {
    try {
      final result = await apiService.get(
          endPoint: "${ApiConstant.department}/search/$searchKey");
      if (result[ApiConstant.successApiKey] == true) {
        return Right(DepartmentValue.fromJson(result['value']));
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  // Edit Department
  Future<Either<Failure, void>> editDepartment(
      {required int id, required String departmentName}) async {
    try {
      final result = await apiService.put(
          endPoint: "${ApiConstant.department}/$id",
          body: {"departmentName": departmentName});
      if (result[ApiConstant.successApiKey] == true) {
        return const Right(null);
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
