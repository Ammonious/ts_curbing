import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:tscurbing/common/navigation/nav_bar/nav_bar.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

import '../../utils/constants.dart';

class NavigationHostTablet extends HookWidget {
	final NavigationViewModel model = locator<NavigationViewModel>();
	NavigationHostTablet({
		                     Key key,
	                     }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final selectedIndex = useState<int>(0);
		final extended = useState<bool>(false);
		final scaleHeight = ScreenUtil.screenHeightDp;
		final scaleWidth = ScreenUtil.screenWidthDp;
		return Material(
			color: theme.canvasColor,
			child: Column(
				children: [
					NavBar(
						drawerExtended: extended.value,
						onTap: () => extended.value = !extended.value,
					),
					Expanded(
						child: Row(
							children: [
								SchemeNavRail(
									properties: SchemeNavProperties(
											elevation: 0.1,
											minExtendedWidth: 250,
											minWidth: 72,
											extended: extended.value,
											selectedTextStyle: theme.subtitle2.copyWith(color: theme.themeColor,fontWeight: FontWeight.bold),
											unSelectedTextStyle: theme.subtitle2.copyWith(color: theme.canvasColor.textColor,fontWeight: FontWeight.bold),
											railLabelType: NavigationRailLabelType.none,
											railAlignment: RailAlignment.top,
											backgroundColor: theme.canvasColor),
									items: model.navItems,
									selectedIndex: model.setSelectedIndex(model.navItems[selectedIndex.value].route),
									onDestinationSelected: (index) => selectedIndex.value = index,
								),
								Expanded(
									child: Container(
										decoration: BoxDecoration(
												color: theme.cardColor,
												boxShadow: normalShadow,
												borderRadius: theme.desktopCardRadius),
										child: page,
									),
								)
							],
						),
					)
				],
			),
		);
	}
}