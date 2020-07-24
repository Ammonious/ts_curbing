import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';

class ServiceCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String imagePath;
  final Function onSelect;
  ServiceCard({Key key, this.selected = false, @required this.title, @required this.imagePath, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: () => onSelect(),borderRadius: BorderRadius.circular(32),
        child: Container(
          height: screenHeight * .12,
          width: (screenWidth(context) *.40) / 4,
          decoration: selected ? selectedDecoration : decoration,
          padding: EdgeInsets.only(left: 8,right: 8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                SizedBox(height: 16),
                AutoSizeText(
                  title,maxLines: 2,textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : AppTheme.nearlyBlack),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  get selectedDecoration => ShapeDecoration(
      gradient: theme.themeGradient,
      shape: SuperellipseShape(borderRadius: BorderRadius.circular(72)));
  get decoration => ShapeDecoration(
      shape: SuperellipseShape(
          borderRadius: BorderRadius.circular(72),
          side: BorderSide(width: 3.5, color: Colors.grey.withOpacity(.45))));
}
