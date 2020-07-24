
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_view_model.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

class NavBarDesktop extends StatelessWidget {
	final NavigationViewModel model = locator();
	final bool drawerExtended;
	final Function onTap;
	NavBarDesktop({Key key, this.drawerExtended, this.onTap}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Material(color: Colors.transparent,child: Container(
			height: 72 + topPadding(context),
			padding: EdgeInsets.only(top: topPadding(context)),
			child: Container(
				height: 72,
				padding: EdgeInsets.only(left: 14),
				child: Stack(alignment: Alignment.center,
					children: [
						Align(
							alignment: Alignment.centerLeft,
							child: IconButton(
								icon: Icon(BoxIcon.bxMenuAltleft,color: theme.canvasColor.textColor,),
								onPressed: () => onTap(),
							),
						),
						AnimatedPositioned(duration: normalDuration,left: drawerExtended ?  224 : 86,child:  Image.asset(model.logo,height: 32,),),
						Align(alignment: Alignment.centerRight,child: Row(mainAxisSize: MainAxisSize.min,  children: [

							SchemeButton(
								buttonStyle: SchemeButtonStyle.gradient,
								label: 'Sign In',
								color: theme.themeColor,
								textStyle: theme.button_gradient,
								width: 100,
								height: 52,
								decoration: SchemeButtonDecoration(boxShadow: normalShadow,
									superEllipseShape: true,
								),
							),
							SizedBox(width: 24)
						],),)
					],
				),
			),
		),);
	}
}