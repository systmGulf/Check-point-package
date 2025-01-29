import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/internet_checker.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../models/customers/add_customer_request_body.dart';
import '../../models/customers/get_customer_model.dart';
import 'customer_repo.dart';

class CustomerRepoImpl implements CustomerRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  CustomerRepoImpl({required this.apiService, required this.networkInfo});

  @override
  Future<Either<Failure, void>> addCustomer(
      AddOrEditCustomerRequestBody departmentValue) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.post(
            endPoint: ApiConstant.addCustomer, body: departmentValue.toJson());
        if (result[ApiConstant.successApiKey] == true) {
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
  Future<Either<Failure, void>> deleteCustomer({required String id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.delete(
            endPoint: "${ApiConstant.addCustomer}?id=$id");
        if (result[ApiConstant.successApiKey] == true) {
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
  Future<Either<Failure, void>> editCustomer(
      AddOrEditCustomerRequestBody departmentValue,
      {required String id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.put(
            endPoint: "${ApiConstant.addCustomer}/$id",
            body: departmentValue.toJson());
        if (result[ApiConstant.successApiKey] == true) {
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
  Future<Either<Failure, CustomerValue>> getCustomersByType(
      {required String type}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.get(
            endPoint: ApiConstant.addCustomer + "/customerType/$type");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(CustomerValue.fromJson(result['value']));
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
