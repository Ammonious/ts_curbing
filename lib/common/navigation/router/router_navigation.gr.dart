// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tscurbing/common/pages/landing_page/landing_page.dart';

abstract class Routes {
  static const landingPage = '/';
}

class NavRouter extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<NavRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.landingPage:
        if (hasInvalidArgs<LandingPageArguments>(args)) {
          return misTypedArgsRoute<LandingPageArguments>(args);
        }
        final typedArgs =
            args as LandingPageArguments ?? LandingPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LandingPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//LandingPage arguments holder class
class LandingPageArguments {
  final Key key;
  LandingPageArguments({this.key});
}
