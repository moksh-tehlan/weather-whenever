import 'package:weather_whenever/data/models/search_location/search_location_model.dart';
import 'package:weather_whenever/data/network/api/search_location/search_location_api.dart';

class SearchLocationRepository {
  SearchLocationApi searchLocationApi;
  SearchLocationRepository({required this.searchLocationApi});

  Future<List<SearchLocationModel>> getSearchedLocation({required String query}) {
    return searchLocationApi.searchLocationApi(query: query);
  }
}
