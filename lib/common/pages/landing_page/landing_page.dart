import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/utils/stream_manager.dart';
import 'landing_page_mobile.dart';
import 'landing_page_desktop.dart';
import 'landing_page_tablet.dart';
import 'model/landing_view_model.dart';

class LandingPage extends StatelessWidget {
  final LandingViewModel model = locator<LandingViewModel>();
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [streamLandingTemplate, streamServices],
      child: ScreenTypeLayout(
        mobile: OrientationLayoutBuilder(
          portrait: (context) => mobile(),
          landscape: (context) => mobile(),
        ),
        tablet: OrientationLayoutBuilder(
          portrait: (context) => tablet(),
          landscape: (context) => desktop(),
        ),
        desktop: desktop(),
      ),
    );
  }

  mobile() => LandingPageMobile();

  tablet() => LandingPageTablet();

  desktop() => LandingPageDesktop();
}
