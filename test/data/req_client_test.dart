import 'package:finder_app/src/core/data/req_client.dart';
import 'package:finder_app/src/features/intro/data/model/location_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'req_client_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ReqClient reqClient;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    reqClient = ReqClient()..dio = mockDio;
  });

  group('ReqClient', () {
    const ip = "84.71.81.176";
    const url = 'https://ipapi.co/$ip/json';
    const ipUrl = '"https://api.ipify.org"';

    const mockApiResponse = {
      "ip": ip,
      "network": "84.71.80.0/20",
      "version": "IPv4",
      "city": "Ilford",
      "region": "England",
      "region_code": "ENG",
      "country": "GB",
      "country_name": "United Kingdom",
      "country_code": "GB",
      "country_code_iso3": "GBR",
      "country_capital": "London",
      "country_tld": ".uk",
      "continent_code": "EU",
      "in_eu": false,
      "postal": "IG1",
      "latitude": 51.5564,
      "longitude": 0.0715,
      "timezone": "Europe/London",
      "utc_offset": "+0000",
      "country_calling_code": "+44",
      "currency": "GBP",
      "currency_name": "Pound",
      "languages": "en-GB,cy-GB,gd",
      "country_area": 244820.0,
      "country_population": 66488991,
      "asn": "AS5378",
      "org": "Vodafone Limited",
    };

    test('getWithoutHeaderClient returns valid response', () async {
      final mockResponse = Response(
        data: mockApiResponse,
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );

      when(
        mockDio.get(url, options: anyNamed('options')),
      ).thenAnswer((_) async => mockResponse);

      final response = await reqClient.getWithoutHeaderClient(url);

      expect(response.statusCode, 200);

      // Deserialize into LocationModel
      final location = LocationModel.fromJson(response.data);
      expect(location.ip, ip);
      expect(location.region, "England");
      expect(location.countryName, "United Kingdom");
    });

    test('getWithoutHeaderClient throws an error on failure', () async {
      when(
        mockDio.get(url, options: anyNamed('options')),
      ).thenThrow(DioError(requestOptions: RequestOptions(path: url)));

      expect(
        () async => await reqClient.getWithoutHeaderClient(url),
        throwsA(isA<DioError>()),
      );
    });

    test('getWithoutHeaderClientPlain returns plain text response', () async {
      final mockResponse = Response(
        data: ip,
        statusCode: 200,
        requestOptions: RequestOptions(path: ipUrl),
      );

      when(
        mockDio.get(url, options: anyNamed('options')),
      ).thenAnswer((_) async => mockResponse);

      final response = await reqClient.getWithoutHeaderClientPlain(ipUrl);

      expect(response.statusCode, 200);
      expect(response.data, ip);
      verify(mockDio.get(url, options: anyNamed('options'))).called(1);
    });

    test('isValidResponse returns true for valid status codes', () {
      expect(isValidResponse(200), isTrue);
      expect(isValidResponse(302), isTrue);
      expect(isValidResponse(400), isFalse);
    });
  });
}
