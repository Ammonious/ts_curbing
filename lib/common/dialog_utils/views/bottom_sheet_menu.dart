import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/menu_item.dart';
import '../dialog_model.dart';
import 'bottom_sheet_menu_item.dart';

enum SheetType { draggable, normal }

class BottomSheetMenu extends StatelessWidget {
  final String title;
  final List<MenuItem> menuItems;
  final DialogType dialogType;
  final Function(int index) onSelection;

  BottomSheetMenu(
      {Key key,
      this.title,
      @required this.menuItems,
      @required this.onSelection, this.dialogType = DialogType.sheet, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil.screenHeightDp;
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize:  menuItems.length <= 3 ? smallPhone(height) ? 0.85 : 0.55 : 0.85,
        minChildSize: 0.5,
        builder: (context, scrollController) => Column(
          children: <Widget>[
            Expanded(
              child: AnimatedContainer(
                duration: normalDuration,
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: theme.canvasColor,
                  borderRadius: theme.topCardRadius,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: normalDuration,
                      padding: EdgeInsets.only(left: 16.0, top: ScreenUtil.statusBarHeight),
                      height: kToolbarHeight + ScreenUtil.statusBarHeight,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: AutoSizeText(
                                title,
                                style: theme.headline6,
                              )),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: theme.canvasColor.textColor,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 24, bottom: 24),
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) => MenuSheetItem(
                          menuItem: menuItems[index],
                          index: index,
                          onSelection: () => onSelection != null ? onSelection(index) : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }


}
