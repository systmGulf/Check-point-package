import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/admin/data/models/shifts_and_polices_model/get_police_by_shift_id.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';

import '../../models/shifts_and_polices_model/add_police_request_body.dart';
import '../../models/shifts_and_polices_model/shifts_model.dart';

abstract class ShiftsAndPolicesRepo {
  Future<Either<Failure, void>> addShift({required String shiftName});
  Future<Either<Failure, ShiftModel>> getShifts();
  Future<Either<Failure, void>> deleteShift({required int id});
  Future<Either<Failure, void>> addPolice(
      {required AddPoliceRequestBody addPoliceRequestBody});
  Future<Either<Failure, PoliceResponse>> getPoliceByShiftId(
      {required int shiftId});
  Future<Either<Failure, void>> deletePolice({required int id});
  Future<Either<Failure, void>> editPolice(
      {required AddPoliceRequestBody addPoliceRequestBody, required int id});
}
