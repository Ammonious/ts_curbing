// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tscurbing/common/navigation/navigation_host/navigation_host.dart';

abstract class Routes {
  static const home = '/';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        if (hasInvalidArgs<NavigationHostArguments>(args)) {
          return misTypedArgsRoute<NavigationHostArguments>(args);
        }
        final typedArgs =
            args as NavigationHostArguments ?? NavigationHostArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              NavigationHost(key: typedArgs.key),
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

//NavigationHost arguments holder class
class NavigationHostArguments {
  final Key key;
  NavigationHostArguments({this.key});
}
