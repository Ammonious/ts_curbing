import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'navigation_host_mobile.dart';
import 'navigation_host_desktop.dart';
import 'navigation_host_tablet.dart';


class NavigationHost extends StatelessWidget {
	NavigationHost({Key key,}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		ScreenUtil.init(context);
		return ScreenTypeLayout(
			mobile: OrientationLayoutBuilder(
				portrait: (context) => mobile(),
				landscape: (context) => mobile(),
			),
			tablet: OrientationLayoutBuilder(
				portrait: (context) => tablet(),
				landscape: (context) => desktop(),
			),
			desktop: desktop(),
		);
	}

	mobile() {
		return NavigationHostMobile();
	}

	tablet() {
		return NavigationHostTablet();
	}

	desktop() {
		return NavigationHostDesktop();
	}
}