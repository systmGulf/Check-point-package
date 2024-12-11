import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/branches/add_branch_request_body.dart';
import '../../models/branches/get_branches_models.dart';


abstract class BranchesRepo {
  Future<Either<Failure, GetBranchesValue>> getAllBranches();
  Future<Either<Failure, void>> addCompanyBranch(
      {required AddBrachRequestBody AddBrachRequestBody});
  Future<Either<Failure, void>> deleteBranch({required int id});    
}
