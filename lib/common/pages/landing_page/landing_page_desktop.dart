import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';

import 'section_one/section_one.dart';

class LandingPageDesktop extends StatelessWidget {
  LandingPageDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container( decoration: BoxDecoration(
		      borderRadius: BorderRadius.circular(24), color: Colors.white, boxShadow: largeShadow),
	      margin: EdgeInsets.only(
		      left: 72,
		      right: 72,
		      top: appbarWithPadding(context),
	      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionOne(),
          ],
        ),
      ),
    );
  }
}
