import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/internet_checker.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../models/department_model/department_model.dart';
import 'department_repo.dart';

class DepartmentRepoImpl implements DepartmentRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  DepartmentRepoImpl({required this.apiService, required this.networkInfo});

  @override
  Future<Either<Failure, void>> addDepartment(
      {required String departmentName}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.post(
            endPoint: ApiConstant.department,
            body: {"departmentName": departmentName});
        if (result['isSuccess'] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteDepartment({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.delete(
            endPoint: "${ApiConstant.department}?id=$id");
        if (result['isSuccess'] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DepartmentValue>> getAllDepartments() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.get(endPoint: ApiConstant.department);
        if (result['isSuccess'] == true) {
          return Right(DepartmentValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DepartmentValue>> searchDepartments(
      {required String searchKey}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.get(
            endPoint: "${ApiConstant.department}/search/$searchKey");
        if (result['isSuccess'] == true) {
       
          return Right(DepartmentValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editDepartment(
      {required int id, required String departmentName}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.put(
            endPoint: "${ApiConstant.department}/$id",
            body: {"departmentName": departmentName});
        if (result['isSuccess'] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
