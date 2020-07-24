import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../common/locator/locator.iconfig.dart';

GetIt locator = GetIt.instance;


@injectableInit
void setupLocator() => $initGetIt(locator);





// ignore: slash_for_doc_comments
/********************************
 * ? flutter packages pub run build_runner build
 * ? flutter packages pub run build_runner watch

 *********************************/