import 'package:dio/dio.dart';

class ReqClient {
  Dio dio = Dio();

  Future<Response> getWithoutHeaderClient(url) async {
    return await dio.get(
      url,
      options: Options(
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        },
      ),
    );
  }

  Future<Response> getWithoutHeaderClientPlain(url) async {
    return await dio.get(
      url,
      options: Options(responseType: ResponseType.plain),
    );
  }
}

bool isValidResponse(int statusCode) {
  return statusCode >= 200 && statusCode <= 302;
}
