import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../models/customers/add_customer_request_body.dart';
import '../../models/customers/get_customer_model.dart';

abstract class CustomerRepo {
  Future<Either<Failure, void>> addCustomer(AddOrEditCustomerRequestBody departmentValue);
  Future<Either<Failure, CustomerValue>> getCustomersByType({required String type});

  Future<Either<Failure, void>> deleteCustomer({required String id});
  Future<Either<Failure, void>> editCustomer(
      AddOrEditCustomerRequestBody departmentValue,
      {required String id});
}
