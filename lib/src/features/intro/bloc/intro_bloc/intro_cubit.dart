import 'package:dio/dio.dart';
import 'package:finder_app/src/core/data/req_client.dart';
import 'package:finder_app/src/features/intro/data/model/location_model.dart';
import 'package:finder_app/src/features/intro/data/repo/intro_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "intro_state.dart";

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitState());
  LocationModel? data;
  final IntroRepo _repo = IntroRepo();

  int? router;

  fetchUserIp() async {
    emit(IntroLoading());
    router = 1;
    Response responseData = await _repo.getUserIP();
    debugPrint("responseData::::$responseData");
    debugPrint("responseDatacode::::${responseData.statusCode}");
    if (isValidResponse(responseData.statusCode!)) {
      //data = response;
      debugPrint("responseData::::$responseData");
      //emit(IntroSuccess(message: "Successful", router: 1));
      fetchUserLatLong(ip: responseData.data);
    } else {
      emit(IntroError(error: "An error occurred"));
    }
  }

  fetchUserLatLong({required String ip}) async {
    emit(IntroLoading());
    router = 1;
    Response responseData = await _repo.getUserLatLong(ip: ip);
    debugPrint("responseData::::${responseData.data}");
    if (isValidResponse(responseData.statusCode!)) {
      LocationModel response = LocationModel.fromJson(responseData.data);
      debugPrint("responseData::::$response");
      data = response;
      emit(IntroSuccess(message: "Successful", router: 1));
    } else {
      emit(IntroError(error: "An error occurred"));
    }
  }
}
