import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'common/locator/locator.dart';
import 'common/navigation/models/navigation_service.dart';
import 'common/navigation/router/router.gr.dart';
import 'common/theme/app_theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SchemeThemeProvider(
      theme: theme,
      themeModel: themeModel,
      builder: (context, themeData, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData ?? theme.themeModel.schemeLight,
        darkTheme: themeData ?? theme.themeModel.schemeDark,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: Router().onGenerateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
