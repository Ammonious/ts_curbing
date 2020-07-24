// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/auth/services/auth_service.dart';
import 'package:tscurbing/common/dialog_utils/dialog_service.dart';
import 'package:tscurbing/api/quickbooks_api.dart';
import 'package:tscurbing/common/pages/landing_page/model/landing_view_model.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<DialogService>(() => DialogService());
  g.registerLazySingleton<IntuitAPI>(() => IntuitAPI());
  g.registerLazySingleton<LandingViewModel>(() => LandingViewModel());
  g.registerLazySingleton<NavigationService>(() => NavigationService());
  g.registerLazySingleton<NavigationViewModel>(() => NavigationViewModel());
  g.registerLazySingleton<SchemeTheme>(() => SchemeTheme());
}
