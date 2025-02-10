import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';

abstract class BranchesRepo {
  // Get all branches Method
  Future<Either<Failure, GetBranchesValue>> getAllBranches();
  // Add new branch
  Future<Either<Failure, void>> addCompanyBranch(
      {required AddBrachRequestBody AddBrachRequestBody});
  // Delete branch
  Future<Either<Failure, void>> deleteBranch({required int id});
}
