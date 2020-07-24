import 'package:auto_route/auto_route_annotations.dart';
import 'package:tscurbing/common/navigation/navigation_host/navigation_host.dart';
import 'app_host.dart';
import 'custom_transition.dart';
import 'package:auto_route/auto_route.dart' hide TransitionsBuilders;

@CustomAutoRouter()
class $Router {


	@initial
	NavigationHost home;


}


// ignore: slash_for_doc_comments
/********************************
 * ! Build Runner Commands
 * ? flutter packages pub run build_runner build
 * ? flutter packages pub run build_runner watch

 *********************************/