import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:tscurbing/common/navigation/router/router_navigation.gr.dart';

/// Provides a service that can be injected into the ViewModels for navigation.
///
/// Uses the Get library for all navigation requirements
@lazySingleton
class NavigationService {
	get navigatorKey => Get.key;

	bool back({dynamic result}) {
		Get.back(result: result);
		return Get.key.currentState.canPop();
	}
	Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
		return Get.toNamed(routeName, arguments: arguments);
	}

	Future<dynamic> replaceWith(String routeName, {dynamic arguments}) {
		return Get.offNamed(routeName, arguments: arguments);
	}

}

 get page => ExtendedNavigator<NavRouter>(
	 router: NavRouter(),
 );


replacePage(String routeName) => ExtendedNavigator.ofRouter<NavRouter>().pushReplacementNamed(routeName);