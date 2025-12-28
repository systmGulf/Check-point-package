import 'package:dio/dio.dart';

import '../../hr_manamgement_system_package.dart';
import '../errors/custom_exception.dart';
import '../errors/status_code.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;
  Future<dynamic> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    try {
      var response = await _dio.post(endPoint,
          data: body,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${ApiConstant.token}',
            },
          ));

      return response.data;
    } on Exception catch (e) {
      if (e is DioException) {
        _handleDioException(e);
      } else {
        return ErrorHandler.handle(e).failure;
      }
    }
  }

  Future<dynamic> get(
      {required String endPoint, Map<String, dynamic>? body}) async {
    try {
      var response = await _dio.get(endPoint,
          data: body,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${ApiConstant.token}',
            },
          ));

      return response.data;
    } on Exception catch (e) {
      if (e is DioException) {
        _handleDioException(e);
      } else {
        return ErrorHandler.handle(e).failure;
      }
    }
  }

  Future<dynamic> put(
      {required String endPoint, required Map<String, dynamic> body}) async {
    try {
      var response = await _dio.put(endPoint,
          data: body,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${ApiConstant.token}',
            },
          ));

      return response.data;
    } on Exception catch (e) {
      if (e is DioException) {
        _handleDioException(e);
      } else {
        return ErrorHandler.handle(e).failure;
      }
    }
  }

  Future<dynamic> delete({required String endPoint}) async {
    try {
      var response = await _dio.delete(endPoint,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${ApiConstant.token}',
            },
          ));

      return response.data;
    } on Exception catch (e) {
      if (e is DioException) {
        _handleDioException(e);
      } else {
        return ErrorHandler.handle(e).failure;
      }
    }
  }

  dynamic _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}
