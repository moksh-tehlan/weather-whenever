import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_whenever/data/models/current_location/current_location_model.dart';
import 'package:weather_whenever/data/models/current_weather/current_weather_model.dart';
import 'package:weather_whenever/data/repository/current_location/current_location_repository.dart';
import 'package:weather_whenever/data/repository/current_weather/current_weather_repository.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrentWeatherRepository _currentWeatherRepository;
  final CurrentLocationRepository _currentLocationRepository;

  HomeBloc(
      {required CurrentWeatherRepository currentWeatherRepository,
      required CurrentLocationRepository currentLocationRepository})
      : _currentWeatherRepository = currentWeatherRepository,
        _currentLocationRepository = currentLocationRepository,
        super(const HomeState.initial()) {
    on<_GetCurrentWeather>(_onGetCurrentWeather);
    on<_GetCurrentLocation>(_onGetCurrentLocation);
  }

  Future<void> _onGetCurrentWeather(
      _GetCurrentWeather event, Emitter<HomeState> emit) async {
    try {
      emit(const _Loading());

      // getting current location
      final CurrentLocationModel currentLocationModel;

      if (event.currentLocationModel == null) {
        currentLocationModel =
            await _currentLocationRepository.getCurrentLocation();

        debugPrint(
            'latitude is : ${currentLocationModel.latitude}\nlongitude is : ${currentLocationModel.longitude}');
      } else {
        currentLocationModel = event.currentLocationModel!;
      }

      // getting current weather
      final CurrentWeatherModel currentWeatherModel =
          await _currentWeatherRepository.getCurrentWeather(
              lat: currentLocationModel.latitude.toString(),
              lon: currentLocationModel.longitude.toString());

      emit(_Loaded(model: currentWeatherModel));
    } catch (e) {
      emit(_Error(error: "There has been an error: ${e.toString()}"));
    }
  }

  Future<CurrentLocationModel> _onGetCurrentLocation(event, emit) async {
    final CurrentLocationModel currentLocationModel =
        await _currentLocationRepository.getCurrentLocation();

    debugPrint(
        'latitude is : ${currentLocationModel.latitude}\nlongitude is : ${currentLocationModel.longitude}');

    return currentLocationModel;
  }
}
