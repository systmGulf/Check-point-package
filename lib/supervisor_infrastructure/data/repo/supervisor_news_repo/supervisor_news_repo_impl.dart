import 'package:dartz/dartz.dart';

import '../../../../hr_manamgement_system_package.dart';
import '../../models/supervisor_news_model/company_event_response.dart';
import '../../models/supervisor_news_model/supervisor_news_response.dart';
import '../../models/supervisor_news_model/user_news_response.dart';
import 'supervisor_news_repo.dart';

class SupervisorNewsRepoImpl implements SupervisorNewsRepo {
  final ApiService apiService;

  SupervisorNewsRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<AnnouncementItem>>> getAnnouncement({
    required String employeeId,
  }) async {
    try {
      final result = await apiService.get(
        endPoint: "${ApiConstant.announcement}/employee/$employeeId",
      );
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'] as List<dynamic>? ?? [];
        return Right(value.map((e) => AnnouncementItem.fromJson(e)).toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserNewsItem>>> getUserNews() async {
    try {
      final result = await apiService.get(endPoint: ApiConstant.news);
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'] as List<dynamic>? ?? [];
        return Right(value.map((e) => UserNewsItem.fromJson(e)).toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<CompanyEventItem>>> getCompanyEvents({
    required String employeeId,
  }) async {
    try {
      final result = await apiService.get(
        endPoint: "${ApiConstant.companyEvent}/employee/$employeeId",
      );
      if (result[ApiConstant.successApiKey] == true) {
        final value = result['value'] as List<dynamic>? ?? [];
        return Right(value.map((e) => CompanyEventItem.fromJson(e)).toList());
      } else {
        return Left(Failure(404, getResponseError(result)));
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
