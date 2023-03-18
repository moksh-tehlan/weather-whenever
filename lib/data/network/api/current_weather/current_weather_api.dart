import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_whenever/data/models/current_weather/current_weather_model.dart';
import 'package:weather_whenever/data/network/api/endpoints.dart';
import 'package:weather_whenever/data/network/dio_client.dart';

class CurrentWeatherApi {
  final DioClient dioClient;
  CurrentWeatherApi({required this.dioClient});

  Future<CurrentWeatherModel> getCurrentWeather(
      {required String lat, required String long}) async {
    try {
      final response =
          await dioClient.get(Endpoints.currenWeather, queryParameters: {
        'lat': lat,
        'lon': long,
        'units': 'metric',
        'lang': 'en',
        'appid': Endpoints.appId
      });
      debugPrint('''${response.runtimeType}''');
      final CurrentWeatherModel currentWeatherModel =
          CurrentWeatherModel.fromJson(response.data);
      return currentWeatherModel;
    } catch (e) {
      await Fluttertoast.showToast(
          msg: 'something went wrong while calling api ${e.toString()}');
      rethrow;
    }
  }
}
