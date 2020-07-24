

import 'package:auto_route/auto_route_annotations.dart';
import 'package:tscurbing/common/pages/landing_page/landing_page.dart';

@MaterialAutoRouter()
class $NavRouter {

	@CustomRoute(name: 'home',initial: true)
	LandingPage landingPage;


}