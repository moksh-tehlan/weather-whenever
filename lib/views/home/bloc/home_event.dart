part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getCurrentWeather({CurrentLocationModel? currentLocationModel}) = _GetCurrentWeather;
  const factory HomeEvent.getCurrentLocation() = _GetCurrentLocation;
}
