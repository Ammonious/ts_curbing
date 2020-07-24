import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'section_one_mobile.dart';
import 'section_one_desktop.dart';
import 'section_one_tablet.dart';

class SectionOne extends StatelessWidget {
  SectionOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => mobile(),
        landscape: (context) => mobile(),
      ),
      tablet: OrientationLayoutBuilder(
        portrait: (context) => tablet(),
        landscape: (context) => desktop(context),
      ),
      desktop: desktop(context),
    );
  }

  mobile() {
    return SectionOneMobile();
  }

  tablet() {
    return SectionOneTablet();
  }

  desktop(BuildContext context) {
    return SectionOneDesktop(
    );
  }


}
