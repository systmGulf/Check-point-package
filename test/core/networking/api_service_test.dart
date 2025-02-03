import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_management_system_package/core/common_methods/network_checker.dart';
import 'package:hr_management_system_package/core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('ApiService', () {
    late MockDio mockDio;
    late ApiService apiService;
    late NetworkChecker networkInfo;
    setUp(() {
      mockDio = MockDio();
      networkInfo = NetworkChecker();
      apiService = ApiService( dio: mockDio);
    });

    test('Test Post Method Should Return Map of Data', () async {
      when(mockDio.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(
                    path: 'Employee', baseUrl: 'http://ems.runasp.net/api/'),
                statusCode: 200,
                data: {"data": {}},
              ));
      final response = await apiService.post(endPoint: 'Employee', body: {});
      expect(response, isA<Map<String, dynamic>>());
    });
    test('Test Post Method Should Throw ServerFailure', () async {
      when(mockDio.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenThrow(Failure(404, 'eror'));
      expect(() async => await apiService.post(endPoint: 'Employee', body: {}),
          throwsA(isA<ErrorHandler>()));
    });
 
    test('Test Put Method Should Return Map of Data', () async {
      when(mockDio.put(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(
                    path: 'Employee', baseUrl: 'http://ems.runasp.net/api/'),
                statusCode: 200,
                data: {"data": {}},
              ));
      final response = await apiService.put(endPoint: 'Employee', body: {});
      expect(response, isA<Map<String, dynamic>>());
    });

    test('Test Get Method Should Return Map of Data', () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(
                    path: 'Employee', baseUrl: 'http://ems.runasp.net/api/'),
                statusCode: 200,
                data: {"data": {}},
              ));
      final response = await apiService.get(endPoint: 'Employee');
      expect(response, isA<Map<String, dynamic>>());
    });
  

    test('Test Delete Method Should Return Map of Data', () async {
      when(mockDio.delete(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(
                    path: 'Employee', baseUrl: 'http://ems.runasp.net/api/'),
                statusCode: 200,
                data: {"data": {}},
              ));
      final response = await apiService.delete(endPoint: 'Employee');
      expect(response, isA<Map<String, dynamic>>());
    });
  });
     
}
