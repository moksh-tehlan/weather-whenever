part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({required CurrentWeatherModel model}) = _Loaded;
  const factory HomeState.error({required String error}) = _Error;

}