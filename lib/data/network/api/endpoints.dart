class Endpoints {
  Endpoints._();

  static late String baseUrl;

  static const String appId = "142fe772963ce9b51f58e6b888796c10";

  static const String developmentUrl =
      "https://api.openweathermap.org/data/2.5";

  static const String productionUrl = "https://api.openweathermap.org/data/2.5";

  // receiveTimeout
  static const int receiveTimeout = 25000;

  // connectTimeout
  static const int connectionTimeout = 25000;

  static const String currenWeather = "/weather";
  static const String fiveDayWeather = "/forecast";
  static const String airQuality = "/air_pollution";

}
