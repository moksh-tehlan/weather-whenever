import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_whenever/data/network/api/current_location/current_location_api.dart';
import 'package:weather_whenever/data/network/api/current_weather/current_weather_api.dart';
import 'package:weather_whenever/data/network/api/search_location/search_location_api.dart';
import 'package:weather_whenever/data/network/dio_client.dart';
import 'package:weather_whenever/data/repository/current_location/current_location_repository.dart';
import 'package:weather_whenever/data/repository/current_weather/current_weather_repository.dart';
import 'package:weather_whenever/data/repository/search_location/search_location_repository.dart';

final getIt = GetIt.instance;

void setupDependencyLocator() {
  getIt
    ..registerSingleton(Dio())
    ..registerSingleton(DioClient(getIt<Dio>()))
    ..registerSingleton(CurrentWeatherApi(dioClient: getIt<DioClient>()))
    ..registerSingleton(
        CurrentWeatherRepository(currentWeatherApi: getIt<CurrentWeatherApi>()))
    ..registerSingleton(CurrentLocationApi())
    ..registerSingleton(CurrentLocationRepository(
        currentLocationApi: getIt<CurrentLocationApi>()))
    ..registerSingleton(SearchLocationApi(dioClient: getIt<DioClient>()))
    ..registerSingleton(SearchLocationRepository(
        searchLocationApi: getIt<SearchLocationApi>()));
}
