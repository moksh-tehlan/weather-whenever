import 'package:auto_route/annotations.dart';
import 'package:weather_whenever/views/views.dart';

import '../views/search/view/search_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SearchPage)
  ])
class $AppRouter{}