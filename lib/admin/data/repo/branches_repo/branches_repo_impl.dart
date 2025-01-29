import 'package:dartz/dartz.dart';

import '../../../../core/errors/internet_checker.dart';
import '../../../../hr_manamgement_system_package.dart';
import '../../models/branches/add_branch_request_body.dart';
import '../../models/branches/get_branches_models.dart';

class AdminRepoImpl implements BranchesRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  AdminRepoImpl({required this.apiService, required this.networkInfo});

  @override
  Future<Either<Failure, void>> addCompanyBranch(
      {required AddBrachRequestBody AddBrachRequestBody}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.post(
            endPoint: ApiConstant.branches, body: AddBrachRequestBody.toJson());
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
  Future<Either<Failure, GetBranchesValue>> getAllBranches() async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result = await apiService.get(endPoint: ApiConstant.branches);
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetBranchesValue.fromJson(result['value']));
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
  Future<Either<Failure, void>> deleteBranch({required int id}) async {
   final isConnected = networkInfo.isConnected.value;
    if (isConnected) {
      try {
        final result =
            await apiService.delete(endPoint: "${ApiConstant.branches}/$id");
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
}
