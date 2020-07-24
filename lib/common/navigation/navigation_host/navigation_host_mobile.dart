import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:tscurbing/common/navigation/nav_bar/nav_bar.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

class NavigationHostMobile extends HookWidget {
  final NavigationViewModel model = locator<NavigationViewModel>();
  NavigationHostMobile({
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: 72 + topPadding(context),
                  bottom: kBottomNavigationBarHeight + bottomPadding(context)),
              constraints: BoxConstraints(minHeight: scaleHeight),
              decoration: BoxDecoration(
                  color: theme.cardColor, boxShadow: normalShadow, borderRadius: theme.mobileCardRadius),
              child: page,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SchemeNavigation.bottom(
              selectedIndex: model.setSelectedIndex(model.navItems[selectedIndex.value].route),
              navigationItems: model.navItems,
              onPositionChanged: (index) => replacePage(model.navItems[index].route),
              backgroundColor: theme.barColor,
              schemeBarStyle: SchemeBarStyle.flare,
              indicatorGradient: createGradient(color: theme.themeColor),
              height: 72,
              showSelectedLabels: true,
              showUnselectedLabels: false,
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child:NavBar()
          ),
        ],
      ),
    );
  }

  routeName(int selectedIndex) => model.navItems[selectedIndex].route;
}
