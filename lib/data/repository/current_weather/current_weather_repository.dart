import 'package:weather_whenever/data/models/current_weather/current_weather_model.dart';

import '../../network/api/current_weather/current_weather_api.dart';

class CurrentWeatherRepository {
  final CurrentWeatherApi currentWeatherApi;
  CurrentWeatherRepository({required this.currentWeatherApi});

  Future<CurrentWeatherModel> getCurrentWeather(
          {required String lat, required String lon}) async =>
      await currentWeatherApi.getCurrentWeather(lat: lat, long: lon);
}
