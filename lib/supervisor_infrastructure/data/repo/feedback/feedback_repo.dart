

import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/core/errors/error_handler.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/feedbacks/add_feedback_request_body.dart';

import '../../models/feedbacks/add_feedback_model.dart' show AddFeedbackModel;
import '../../models/feedbacks/feedback_model.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, FeedbackModel>> getFeedbacks();
  Future<Either<Failure, AddFeedbackModel>> addFeedback(
      AddFeedbackRequest request);
}
