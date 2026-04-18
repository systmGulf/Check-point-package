import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/repo/feedback/feedback_repo.dart';

import '../../../../core/core.dart';
import '../../models/feedbacks/add_feedback_model.dart';
import '../../models/feedbacks/add_feedback_request_body.dart';
import '../../models/feedbacks/feedback_model.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final ApiService dio;

  FeedbackRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, FeedbackModel>> getFeedbacks() async {
    try {
      final response = await dio.get(
          endPoint: ApiConstant.getFeedBacks(ApiConstant.employeeId));

      if (response[ApiConstant.successApiKey] == true) {
        return Right(FeedbackModel.fromJson(response));
      }
      return Left(Failure(404, getResponseError(response)));
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, AddFeedbackModel>> addFeedback(
      AddFeedbackRequest request) async {
    try {
      final response = await dio.post(
          endPoint: ApiConstant.feedback, body: request.toJson());
      if (response[ApiConstant.successApiKey] == true) {
        return Right(AddFeedbackModel.fromJson(response));
      }
      return Left(Failure(404, getResponseError(response)));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
