
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/menu_item.dart';

class DialogRequest {
  String title;
  String description;
  String confirmLabel;
  String cancelLabel;
  DialogType dialogType;
  DialogStyle dialogStyle;
  Widget customDialog;
  bool invalidSession;
  bool isKiosk;
  List<MenuItem> menuItems;
  Function(int) onSelection;

  /// CustomDialog Properties
  TransitionType transitionType;
  double maxWidth;

  double maxHeight;
  EdgeInsets padding;

  /// [InputDialog] Properties

  IconData iconData;
  String inputLabel;
  double height;
  double width;
  double textFieldWidth;
  TextCapitalization textCapitalization;
  TextInputType inputType;
  String initialValue;
  String imagePath;
  DialogRequest(
      {this.title = '',
      this.description = '',
      this.confirmLabel = 'OK',
      this.cancelLabel,
      this.dialogType = DialogType.alert,
      this.dialogStyle,
      this.isKiosk = false,
      this.iconData,
      this.imagePath,
      this.inputLabel,
      this.initialValue,
      this.onSelection,
      this.menuItems,
      this.invalidSession = false,
      this.height = 400,
      this.width = 500,
      this.textFieldWidth = 500,
      this.inputType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.customDialog,
      this.transitionType = TransitionType.SlideBottom,
      this.maxWidth = 500,
      this.maxHeight,
      this.padding = const EdgeInsets.all(0)});
}

class DialogResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;
  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}

class DialogStyle {
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final TextStyle buttonLabelStyle;
  final SchemeButtonStyle confirmButtonStyle;
  final SchemeButtonStyle cancelButtonStyle;
  final SchemeButtonDecoration buttonDecoration;
  final SchemeFieldStyle formFieldStyle;
  final List<Widget> dialogDecorations;

  DialogStyle schemeStyle({
    TextStyle titleStyle,
    TextStyle descriptionStyle,
    TextStyle buttonLabelStyle,
    SchemeButtonStyle confirmButtonStyle,
    SchemeButtonStyle cancelButtonStyle,
    SchemeButtonDecoration decoration,
    SchemeFieldStyle formFieldStyle,
    List<Widget> dialogDecorations,
  }) =>
      DialogStyle(
          titleStyle: titleStyle ?? theme.headline6,
          descriptionStyle: descriptionStyle ?? theme.textTheme.bodyText1,
          buttonLabelStyle: buttonLabelStyle ?? theme.button_gradient,
          confirmButtonStyle: confirmButtonStyle ?? SchemeButtonStyle.flat,
          cancelButtonStyle: cancelButtonStyle ?? SchemeButtonStyle.flat,
          formFieldStyle: formFieldStyle ?? SchemeFieldStyle.card,
          dialogDecorations: <Widget>[]);

  factory DialogStyle.defaultStyle() => DialogStyle(
      titleStyle: theme.headline6,
      descriptionStyle: theme.textTheme.bodyText1,
      buttonLabelStyle: theme.button_gradient,
      confirmButtonStyle: SchemeButtonStyle.flat,
      cancelButtonStyle: SchemeButtonStyle.flat,
      formFieldStyle: SchemeFieldStyle.card,
      dialogDecorations: <Widget>[]);

  DialogStyle(
      {this.cancelButtonStyle = SchemeButtonStyle.flat,
      this.dialogDecorations,
      this.titleStyle,
      this.descriptionStyle,
      this.buttonLabelStyle,
      this.buttonDecoration,
      this.formFieldStyle = SchemeFieldStyle.card,
      this.confirmButtonStyle = SchemeButtonStyle.flat});
}

enum DialogType { input, currency_input, alert, confirmation, custom, progress, info, sheet }
