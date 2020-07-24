import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'nav_bar_mobile.dart';
import 'nav_bar_desktop.dart';
import 'nav_bar_tablet.dart';

class NavBar extends StatelessWidget {
  final bool drawerExtended;
  final Function onTap;
  NavBar({Key key, this.drawerExtended, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return NavBarMobile();
  }

  tablet() {
    return NavBarTablet(drawerExtended: drawerExtended, onTap: () => onTap());
  }

  desktop() {
    return NavBarDesktop(
      drawerExtended: drawerExtended,
      onTap: () => onTap(),
    );
  }
}
