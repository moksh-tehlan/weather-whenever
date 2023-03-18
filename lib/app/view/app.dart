import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../l10n/l10n.dart';
import '../../navigation/routes.gr.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
