import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:tscurbing/common/navigation/nav_bar/nav_bar.dart';
import 'package:tscurbing/common/navigation/router/router_navigation.gr.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

import '../../utils/constants.dart';

class NavigationHostDesktop extends HookWidget {
  final NavigationViewModel model = locator<NavigationViewModel>();
  NavigationHostDesktop({
                          Key key,
                        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final extended = useState<bool>(true);
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
                SizedBox(
                  width: 8,
                ),
                SchemeNavRail(
                  properties: SchemeNavProperties(
                      elevation: 0.1,
                      minExtendedWidth: 200,
                      selectedTextStyle: theme.subtitle1
                          .copyWith(color: theme.themeColor, fontWeight: FontWeight.bold),
                      unSelectedTextStyle: theme.subtitle1.copyWith(
                          color: theme.canvasColor.textColor, fontWeight: FontWeight.bold),
                      minWidth: 72,
                      extended: extended.value,
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

