import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';

class AdminRepoImpl implements BranchesRepo {
  final ApiService apiService;

  AdminRepoImpl({required this.apiService});

  @override
  // add company branch
  Future<Either<Failure, void>> addCompanyBranch(
      {required AddBrachRequestBody AddBrachRequestBody}) async {
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
  }

  @override
  // get all branches
  Future<Either<Failure, GetBranchesValue>> getAllBranches() async {
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
  }

  @override
  // delete branch
  Future<Either<Failure, void>> deleteBranch({required int id}) async {
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
  }
}
