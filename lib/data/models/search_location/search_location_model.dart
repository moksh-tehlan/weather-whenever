import 'package:weather_whenever/data/models/current_location/current_location_model.dart';

List<SearchLocationModel> searchLocationModelFromJson(dynamic data) =>
    List<SearchLocationModel>.from(
        data.map((x) => SearchLocationModel.fromJson(x)));

class SearchLocationModel {
  SearchLocationModel({
    this.coordinates,
    this.placeNameEn,
  });

  Coordinates? coordinates;
  String? placeNameEn;

  factory SearchLocationModel.fromJson(dynamic json) =>
      SearchLocationModel(
        coordinates: Coordinates.fromJson(json["center"]),
        placeNameEn: json["place_name_en"],
      );
}

class Coordinates extends CurrentLocationModel {
  Coordinates({double? latitude, double? longitude})
      : super(latitude: latitude, longitude: longitude);

  factory Coordinates.fromJson(dynamic json) =>
      Coordinates(latitude: json[0], longitude: json[1]);
}
