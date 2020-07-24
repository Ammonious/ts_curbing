
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/menu_item.dart';

class MenuSheetItem extends StatelessWidget {
  final MenuItem menuItem;
  final int index;
  final Function onSelection;
  MenuSheetItem({Key key,@required this.menuItem,@required this.index, this.onSelection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: liftedShadow,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          onTap: () {
            onSelection();
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: menuItem.subtitle == '' ? 22 : 16, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  menuItem.icon == null
                      ? Text(
                    '${index + 1}',
                    style: theme.number.copyWith(color: theme.textColor),
                  )
                      : menuItem.icon,
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          menuItem.title,
                          style: theme.flat_button,
                        ),
                        Visibility(
                            visible: menuItem.subtitle != '',
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(menuItem.subtitle ?? '',
                                  style: theme.textTheme.caption),
                            )),
                      ],
                    ),
                  ),
                  Icon(
                    BoxIcon.bxChevronrightcircle,
                    size: 24,
                    color: AppTheme.nearlyBlack.withOpacity(0.25),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
