import 'package:weather_whenever/bootstrap.dart';
import 'package:weather_whenever/di/service_locator.dart';

import 'app/view/app.dart';
import 'data/network/api/endpoints.dart';

Future<void> main() async {
  Endpoints.baseUrl = Endpoints.developmentUrl;
  setupDependencyLocator();
  await bootstrap(() => App());
}
