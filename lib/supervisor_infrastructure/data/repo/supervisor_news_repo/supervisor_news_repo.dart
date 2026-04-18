import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/supervisor_news_model/supervisor_news_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/supervisor_news_model/user_news_response.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/supervisor_news_model/company_event_response.dart';

import '../../../../core/errors/error_handler.dart';

abstract class SupervisorNewsRepo {
  Future<Either<Failure, List<AnnouncementItem>>> getAnnouncement({
    required String employeeId,
  });
  Future<Either<Failure, List<UserNewsItem>>> getUserNews();
  Future<Either<Failure, List<CompanyEventItem>>> getCompanyEvents({
    required String employeeId,
  });
}
