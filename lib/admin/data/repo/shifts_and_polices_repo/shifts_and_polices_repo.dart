import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';

import '../../models/shifts_and_polices_model/shifts_model.dart';

abstract class ShiftsAndPolicesRepo {
  Future<Either<Failure, void>> addShift({required String shiftName});
  Future<Either<Failure, ShiftModel>> getShifts();
  Future<Either<Failure, void>> deleteShift({required int id});
}
