import 'package:weather_whenever/data/models/current_location/current_location_model.dart';

import '../../network/api/current_location/current_location_api.dart';

class CurrentLocationRepository {
  final CurrentLocationApi currentLocationApi;
  CurrentLocationRepository({required this.currentLocationApi});

  Future<CurrentLocationModel> getCurrentLocation() async {
    final CurrentLocationModel model =
        await currentLocationApi.getCurrentLocationApi();
    return model;
  }
}
