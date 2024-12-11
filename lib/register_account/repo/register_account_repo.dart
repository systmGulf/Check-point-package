import 'package:dartz/dartz.dart';

import '../../core/core.dart';

abstract class RegisterAccountRepo {
  Future<Either<Failure, void>> registerAccount(
      {required String name});
}
