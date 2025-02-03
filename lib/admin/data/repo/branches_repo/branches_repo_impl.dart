import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/branches/add_branch_request_body.dart';
import '../../models/branches/get_branches_models.dart';

class AdminRepoImpl implements BranchesRepo {
  final ApiService apiService;

  AdminRepoImpl({required this.apiService});

  @override
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
