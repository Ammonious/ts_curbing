
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

import '../../utils/constants.dart';

class NavBarMobile extends StatelessWidget {
  final NavigationViewModel model = locator();
  NavBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          height: appbarWithPadding(context),
          padding: EdgeInsets.only(top: topPadding(context)),
          child: Container(
            height: kToolbarHeight,
            padding: EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Image.asset(
                  logoMark,
                  height: 32,
                ),
                Expanded(
                  child: SizedBox(),
                ),
                SchemeButton(
                  buttonStyle: SchemeButtonStyle.icon,
                  iconData: BoxIcon.bxMenuAltright,
                  color: theme.themeColor,
                  textStyle: theme.flat_button,
                  width: 100,
                  height: 42,
                  decoration: SchemeButtonDecoration(boxShadow: normalShadow,
                    superEllipseShape: true,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
