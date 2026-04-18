import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/complaints/add_complaint_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/complaints/complaint_response_model.dart';


class ComplaintsRepoImpl implements ComplaintsRepo {
  ComplaintsRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, ComplaintResponseModel>> getComplaints() async {
    try {
      final employeeId = ApiConstant.employeeId;
      final result =
          await apiService.get(endPoint: ApiConstant.getComplaints(employeeId));
      if (result[ApiConstant.successApiKey] == true) {
        return Right(ComplaintResponseModel.fromJson(result));
      }
      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, AddComplaintsModel>> addComplaint(
    AddComplaintRequestBody requestBody,
  ) async {
    try {
      final result = await apiService.post(
        endPoint: ApiConstant.complaints,
        body: requestBody.toJson(),
      );
      if (result[ApiConstant.successApiKey] == true) {
        return Right(AddComplaintsModel.fromJson(result));
      }
      return Left(Failure(404, getResponseError(result)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
