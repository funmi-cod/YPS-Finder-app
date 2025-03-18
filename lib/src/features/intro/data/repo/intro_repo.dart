import 'package:dio/dio.dart';
import 'package:finder_app/src/core/data/req_client.dart';
import 'package:flutter/material.dart';

class IntroRepo {
  ReqClient requestClient = ReqClient();
  Future<Response> getUserIP() async {
    Response response = await requestClient.getWithoutHeaderClientPlain(
      "https://api.ipify.org",
    );
    debugPrint("Res/// ${response.data}");
    debugPrint("Res code/// ${response.statusCode}");
    return response;
  }

  Future<Response> getUserLatLong({required String ip}) async {
    Response response = await requestClient.getWithoutHeaderClient(
      "https://ipapi.co/$ip/json",
    );
    debugPrint("Res/// ${response.data}");
    return response;
  }
}
