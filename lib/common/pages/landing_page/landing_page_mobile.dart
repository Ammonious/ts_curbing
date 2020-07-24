import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/api/quickbooks_api.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/locator/locator.dart';

import 'section_one/section_one.dart';

class LandingPageMobile extends HookWidget {
	final IntuitAPI api = locator<IntuitAPI>();
  LandingPageMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: appbarWithPadding(context) + 24),
            child: Column(
              children: <Widget>[
                SectionOne()
              ],
            ),
          ),

        ],
      ),
    );
  }
}
