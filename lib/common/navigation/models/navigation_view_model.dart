import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/auth/model/base_model.dart';
import 'package:tscurbing/common/navigation/router/router_navigation.gr.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

import '../../utils/constants.dart';
@lazySingleton
class NavigationViewModel extends BaseModel {
	final flareIconTheme = iconTheme(
		primary: theme.cardColor.textColor,
		primaryAccent: theme.cardColor.textColor.withOpacity(0.4),
		secondary: theme.cardColor.textColor.withOpacity(0.7),
		secondaryAccent: theme.cardColor.textColor.withOpacity(0.4),
	);


	List<NavBarItemData> get navItems => [
		NavBarItemData.flare(
			title: 'Home',
			width: 120,
			flareIcon: FlareIcon.flower,
			selectedScheme: flareIconTheme,
			unSelectedScheme: flareIconTheme,
			route: Routes.landingPage,
		),
		NavBarItemData.flare(
			title: 'Services',
			width: 160,
			flareIcon: FlareIcon.group_class,
			selectedScheme: flareIconTheme,
			unSelectedScheme: flareIconTheme,
			route: Routes.landingPage,
		),
		NavBarItemData.flare(
			title: 'Gallery',
			width: 120,
			selectedScheme: flareIconTheme,
			unSelectedScheme: flareIconTheme,
			flareIcon: FlareIcon.photo,
			route: Routes.landingPage,
		),
		NavBarItemData.flare(
			width: 110,
			flareIcon: FlareIcon.tree_scenary,
			selectedScheme: flareIconTheme,
			unSelectedScheme: flareIconTheme,
			title: 'About',
			route: Routes.landingPage,
		),
		NavBarItemData.flare(
			width: 160,
			flareIcon: FlareIcon.user_square,
			selectedScheme: flareIconTheme,
			unSelectedScheme: flareIconTheme,
			title: 'My Account',
			route: Routes.landingPage,
		),


	];

	final String logo = logoDraft;
	navHeightMobile(BuildContext context) => toolbarWithPadding(context);

	navHeightTablet(BuildContext context) => toolbarWithPadding(context);

	get navHeightDesktop => kToolbarHeight + 16;


	setSelectedIndex(String routeName){
		switch(routeName){
			case Routes.landingPage:
				return 0;
			case Routes.landingPage:
				return 1;
			case Routes.landingPage:
				return 2;
			case Routes.landingPage:
				return 3;
			case Routes.landingPage:
				return 4;
			default: return 0;
		}
	}
}

