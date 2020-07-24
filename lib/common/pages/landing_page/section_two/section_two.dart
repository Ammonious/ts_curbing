import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'section_two_mobile.dart';
import 'section_two_desktop.dart';
import 'section_two_tablet.dart';


class SectionTwo extends StatelessWidget {
	SectionTwo({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ScreenTypeLayout(mobile: OrientationLayoutBuilder(
			portrait: (context) => mobile(), landscape: (context) => mobile(),),
			tablet: OrientationLayoutBuilder(
				portrait: (context) => tablet(), landscape: (context) => desktop(),),
			desktop: desktop(),);
	}

	mobile() {
		return SectionTwoMobile();
	}

	tablet() {
		return SectionTwoTablet();
	}

	desktop() {
		return SectionTwoDesktop();
	}
}