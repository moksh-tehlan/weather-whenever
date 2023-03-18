import 'package:weather_whenever/data/models/search_location/search_location_model.dart';
import 'package:weather_whenever/data/network/dio_client.dart';

class SearchLocationApi {
  final DioClient dioClient;
  final String key = '6rbJoUNHak717DeXfDXU';
  SearchLocationApi({required this.dioClient});

  Future<List<SearchLocationModel>> searchLocationApi({required String query}) async {
    final String searchLocationApi =
        'https://api.maptiler.com/geocoding/$query.json';

    final response = await dioClient.get(searchLocationApi,
        queryParameters: {'language': 'en', 'country': 'in','key': key});

    return searchLocationModelFromJson(response.data['features']);
  }
}
