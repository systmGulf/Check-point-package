import 'package:dartz/dartz.dart';
import 'package:hr_management_system_package/hr_manamgement_system_package.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/complaints/add_complaint_request_body.dart';
import 'package:hr_management_system_package/supervisor_infrastructure/data/models/complaints/complaint_response_model.dart';

import '../../models/complaints/add_complaints_model.dart';

abstract class ComplaintsRepo {
  Future<Either<Failure, ComplaintResponseModel>> getComplaints();

  Future<Either<Failure, AddComplaintsModel>> addComplaint(
    AddComplaintRequestBody requestBody,
  );
}
