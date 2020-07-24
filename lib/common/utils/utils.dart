import 'package:auto_route/auto_route.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';

import '../locator/locator.dart';
import '../navigation/router/router.gr.dart';

navigateToPage(String routeName, {dynamic arguments}) =>
    locator<NavigationService>().navigateTo(routeName, arguments: arguments);

navigateBack({dynamic result}) => locator<NavigationService>().back(result: result);
