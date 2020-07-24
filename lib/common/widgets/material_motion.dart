import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

class MaterialMotion extends StatelessWidget {
	final Color closedColor;
	final Color openColor;
	final Duration transitionDuration;
	const MaterialMotion({Key key, this.closedBuilder, this.transitionType, this.closedColor, this.openColor, this.transitionDuration}) : super(key: key);


	final OpenContainerBuilder closedBuilder;
	final ContainerTransitionType transitionType;

	@override
	Widget build(BuildContext context) {
		return OpenContainer(
			transitionType: ContainerTransitionType.fadeThrough,
			closedColor: closedColor ?? theme.cardColor,
			openColor: openColor ?? theme.canvasColor,
			transitionDuration: transitionDuration ?? Duration(milliseconds: 900),
			openBuilder: (BuildContext context, VoidCallback _) => page,
			tappable: false,
			closedBuilder: closedBuilder,
		);
	}
}