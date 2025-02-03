import 'package:dartz/dartz.dart';

import '../../../../core/common_methods/network_checker.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/networking/api_service.dart';
import '../../models/customers/get_customer_by_id_model.dart';
import '../../models/plan_model/customer_plan_model.dart';
import '../../models/plan_model/get_plan_by_id_model.dart';
import '../../models/plan_model/get_plan_model.dart';
import '../../models/plan_model/set_customer_plan_request_body.dart';
import 'supervisor_plan_repo.dart';

class SupervisorPlanRepoImpl implements SupervisorPlanRepo {
  final ApiService apiservice;


  SupervisorPlanRepoImpl({required this.apiservice, });

  @override
  // get customer plans
  Future<Either<Failure, List<CustomerPlanModel>>> getCustomerPlans() async {
  try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.plan}/departmentId/${ApiConstant.departmentId}");
        if (result[ApiConstant.successApiKey] == true) {
          return Right((result['value'] as List)
              .map((e) => CustomerPlanModel.fromJson(e))
              .toList());
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  
  }

  @override
  // set customer plan
  Future<Either<Failure, void>> setPlanByDate(
      SetPlanByDateRequestBody setPlanByDateRequestBody) async {
  try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Plan,
            body: setPlanByDateRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
   
  }

  @override
  // get plan by id
  Future<Either<Failure, GetPlanByIdValue>> getPlanById(
      {required int id}) async {
 try {
        final result =
            await apiservice.get(endPoint: "${ApiConstant.Plan}/$id");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetPlanByIdValue.fromJson(result['value']));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
 
  }

  @override
  // delete plan
  Future<Either<Failure, void>> deletePlanById({required int id}) async {
  try {
        final result =
            await apiservice.delete(endPoint: "${ApiConstant.Plan}/$id");
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
   
  }

  @override
  // set customer plan
  Future<Either<Failure, void>> setCustomerPlan(
      SetCustomerPlanRequestBody setCustomerPlanRequestBody) async {
     try {
        final result = await apiservice.post(
            endPoint: ApiConstant.plan,
            body: setCustomerPlanRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  // set sub plan
  Future<Either<Failure, void>> setSubPlan(
      {required setSubPlansRequestBody setSubPlansRequestBody}) async {
  try {
        final result = await apiservice.post(
            endPoint: ApiConstant.Plan + "/" + ApiConstant.plan,
            body: setSubPlansRequestBody.toJson());
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
 
  }

  @override
  // delete sub plan
  Future<Either<Failure, void>> deleteSubPlanById({required int id}) async {
try {
        final result = await apiservice.delete(
            endPoint: ApiConstant.Plan + "/" + ApiConstant.plan + "?id=$id");
        if (result[ApiConstant.successApiKey] == true) {
          return const Right(null);
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
   
  }

  @override
  Future<Either<Failure, PlanValue>> getPlanByDepartmentId() async {
  try {
        final result = await apiservice.get(
            endPoint:
                "${ApiConstant.Plan}/department/${ApiConstant.departmentId}");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(
            PlanValue.fromJson(result['value']),
          );
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }

  @override
  // get customer by id
  Future<Either<Failure, GetCustomerByIdModel>> getCustomerById(
      {required String CustomerId}) async {
     try {
        final result = await apiservice.get(
            endPoint: "${ApiConstant.addCustomer}/$CustomerId");
        if (result[ApiConstant.successApiKey] == true) {
          return Right(GetCustomerByIdModel.fromJson(result));
        } else {
          return Left(Failure(404, getResponseError(result)));
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
  }
}
