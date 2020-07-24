 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/auth/model/user.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/utils/utils.dart';

class InformationDialog extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;
  final String buttonLabel;
  final bool isKiosk;
  final Function onDismiss;
  InformationDialog(
      {Key key,
      this.imagePath = '',
      this.title = '',
      this.body = '',
      this.isKiosk = false,
      this.buttonLabel = 'OK',
      this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);  
    return ClipRRect(
      borderRadius: theme.cardRadius,
      child: Container(width: screenWidth(context) - 0,
        constraints:
            BoxConstraints(maxWidth: screenWidth(context), minWidth: 300,maxHeight: 500,minHeight: 300),
        decoration:
            BoxDecoration(color: theme.cardColor, borderRadius: theme.cardRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24),
            CustomImage(
              imagePath: imagePath,
              height: 70,
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,right: 8),
              child: Column(
                children: [
                  SizedBox(height: 24,),
                  Text(
                    title,textAlign: TextAlign.center,
                    style: theme.headline5,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
                    body,textAlign: TextAlign.center,
                    style: theme.textTheme.bodyText1,
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(padding: EdgeInsets.only(right: 12,bottom: 12),
              child: Row(mainAxisSize: MainAxisSize.max, children: [Expanded(child: SizedBox(),),
                SchemeButton(buttonStyle: SchemeButtonStyle.gradient,
                  color: theme.themeColor,decoration: SchemeButtonDecoration(superEllipseShape: true,boxShadow: normalShadow),
                  height: 38,
                  width: 80,
                  textStyle: theme.button_gradient.copyWith(color: theme.themeColor.shade700.textColor),
                  label: buttonLabel,
                  onTap: () => onTap(),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    navigateBack();
    if (onDismiss != null) onDismiss();
  }
}
