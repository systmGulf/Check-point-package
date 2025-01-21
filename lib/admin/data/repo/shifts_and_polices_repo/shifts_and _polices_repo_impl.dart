import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/admin/data/models/shifts_and_polices_model/add_police_request_body.dart';
import 'package:hr_management_system_package/admin/data/models/shifts_and_polices_model/assign_shifts_request_body.dart';
import 'package:hr_management_system_package/admin/data/models/shifts_and_polices_model/get_police_by_shift_id.dart';
import 'package:hr_management_system_package/admin/data/models/shifts_and_polices_model/shifts_model.dart';
import 'package:hr_management_system_package/admin/data/repo/shifts_and_polices_repo/shifts_and_polices_repo.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';

import '../../../../core/errors/internet_checker.dart';

class ShiftsAndPolicesRepoImpl implements ShiftsAndPolicesRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  ShiftsAndPolicesRepoImpl(
      {required this.apiService, required this.networkInfo});

  @override

  // Add new shift

  Future<Either<Failure, void>> addShift({required String shiftName}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService
            .post(endPoint: ApiConstant.Shift, body: {"name": shiftName});
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
  // get all shifts
  Future<Either<Failure, ShiftModel>> getShifts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.get(endPoint: ApiConstant.Shift);
        if (result['isSuccess'] == true) {
          return Right(ShiftModel.fromJson(result));
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
  // delete shift
  Future<Either<Failure, void>> deleteShift({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiService.delete(endPoint: "${ApiConstant.Shift}?id=$id");
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
  // add new police
  Future<Either<Failure, void>> addPolice(
      {required AddPoliceRequestBody addPoliceRequestBody}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.post(
            endPoint: ApiConstant.Policy, body: addPoliceRequestBody.toJson());
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
  // get police by shift id
  Future<Either<Failure, PoliceResponse>> getPoliceByShiftId(
      {required int shiftId}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiService.get(endPoint: "${ApiConstant.Policy}/shift/$shiftId");
        if (result['isSuccess'] == true) {
          return Right(PoliceResponse.fromJson(result));
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
  // delete police
  Future<Either<Failure, void>> deletePolice({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await apiService.delete(endPoint: "${ApiConstant.Policy}?id=$id");
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
  // edit police
  Future<Either<Failure, void>> editPolice(
      {required AddPoliceRequestBody addPoliceRequestBody,
      required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.put(
            endPoint: "${ApiConstant.Policy}/$id",
            body: addPoliceRequestBody.toJson());
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
  Future<Either<Failure, void>> assignShift({required AssignShiftsRequestBody assignShiftsRequestBody})async {
    if (await networkInfo.isConnected) {
      try {
        final result = await apiService.post(
            endPoint: "${ApiConstant.Shift}/assignShift", body: assignShiftsRequestBody.toJson());
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
