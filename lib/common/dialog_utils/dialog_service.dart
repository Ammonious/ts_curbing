import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/navigation/models/navigation_service.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/menu_item.dart';
import 'dialog_model.dart';
import 'dialog_types/alert_dialog.dart';
import 'dialog_types/information_dialog.dart';
import 'dialog_types/input_dialog.dart';
import 'dialog_types/progress_dialog.dart';
import 'views/bottom_sheet_menu.dart';

@lazySingleton
class DialogService {
  Completer<DialogResponse> _dialogCompleter;

  dialogWrapper(Widget child, bool enableTimer) => TimeDismissBuilder.periodic(
        Duration(seconds: 60),
        enabled: enableTimer,
        child: child,
        onFire: () => Get.back(),
      );

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future _getDialog(DialogRequest request) {
    bool confirmed = false;
    switch (request.dialogType) {
      case DialogType.input:
      case DialogType.currency_input:
        return Get.dialog(dialogWrapper(
            InputDialog(
                dialogRequest: request,
                dialogStyle: request.dialogStyle,
                onCancel: () => dialogComplete(request, DialogResponse(confirmed: false)),
                onSubmit: (text) =>
                    dialogComplete(request, DialogResponse(confirmed: true, fieldOne: text))),
            request.isKiosk));
      case DialogType.confirmation:
      case DialogType.alert:
        return Get.dialog(dialogWrapper(CustomAlertDialog(request: request), request.isKiosk));
      case DialogType.custom:
        return Get.dialog(dialogWrapper(
            CardDialogParent(
              child: request.customDialog,
              maxWidth: request.maxWidth,
              maxHeight: request.maxHeight,
              padding: request.padding,
            ),
            request.isKiosk));
      case DialogType.progress:
        return null;
      case DialogType.info:
        return Get.dialog(dialogWrapper(
            InformationDialog(
              imagePath: request.imagePath,
              title: request.title,
              body: request.description,
              buttonLabel: request.confirmLabel,
              isKiosk: request.isKiosk,
            ),
            request.isKiosk));
      case DialogType.sheet:
        return Get.bottomSheet(
            dialogWrapper(
                BottomSheetMenu(
                  title: request.title,
                  menuItems: request.menuItems,
                  dialogType: request.dialogType,
                  onSelection: (index) => _bottomSheetSelection(request, index, confirmed),
                ),
                request.isKiosk),
            backgroundColor: Colors.transparent,
            elevation: 0,
            isScrollControlled: true,
            enableDrag: true,
            isDismissible: true,
            shape: RoundedRectangleBorder(borderRadius: theme.topCardRadius));
      default:
        return Get.dialog(CustomAlertDialog(request: request));
    }
  }

  Future<DialogResponse> showDialog(
      {String title,
      String body,
      String buttonLabel = 'OK',
      DialogType dialogType,
      bool invalidSession = false,
      DialogStyle dialogStyle}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(
        title: title,
        description: body,
        confirmLabel: buttonLabel,
        dialogStyle: dialogStyle,
        invalidSession: invalidSession,
        dialogType: DialogType.alert));
    return _dialogCompleter.future;
  }

  /// Shows a confirmation dialog
  Future<DialogResponse> showConfirmationDialog(
      {String title,
      String body,
      String confirmationLabel = 'OK',
      String cancelLabel = 'Cancel',
      DialogStyle dialogStyle}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(
        title: title,
        description: body,
        confirmLabel: confirmationLabel,
        dialogType: DialogType.confirmation,
        cancelLabel: cancelLabel,
        dialogStyle: dialogStyle));
    return _dialogCompleter.future;
  }

  Future<DialogResponse> showInputDialog(
      {String title,
      String fieldLabel,
      IconData icon,
      String confirmationLabel = 'OK',
      String cancelLabel = 'Cancel',
      DialogStyle dialogStyle}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(
        title: title,
        confirmLabel: confirmationLabel,
        dialogType: DialogType.input,
        iconData: icon,
        cancelLabel: cancelLabel,
        dialogStyle: dialogStyle));
    return _dialogCompleter.future;
  }

  Future<DialogResponse> showInformationDialog(
      {String title,
      String body,
      String imagePath,
      String confirmationLabel = 'OK',
      String cancelLabel = 'Cancel',
      DialogStyle dialogStyle}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(
        title: title,
        description: body,
        confirmLabel: confirmationLabel,
        dialogType: DialogType.confirmation,
        cancelLabel: cancelLabel,
        dialogStyle: dialogStyle));
    return _dialogCompleter.future;
  }

  Future<DialogResponse> showCustomDialog({Widget child}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(dialogType: DialogType.custom, customDialog: child));
    return _dialogCompleter.future;
  }

  Future showBottomSheet(
      {String title, List<MenuItem> menuItems, Function(int selectedIndex) onSelection}) {
    _dialogCompleter = Completer<DialogResponse>();
    _getDialog(DialogRequest(
        dialogType: DialogType.sheet,
        title: title,
        menuItems: menuItems,
        onSelection: (index) => onSelection(index)));
    return _dialogCompleter.future;
  }

  hideProgressDialog() => progressDialog.dismiss();

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(DialogRequest request, DialogResponse response) async {
    Get.back();
    _dialogCompleter.complete(response);
    _dialogCompleter = null;

  }

  _bottomSheetSelection(DialogRequest request, int index, bool confirmed) {
    confirmed = true;
    if (request.onSelection != null) request.onSelection(index);
    dialogComplete(request, DialogResponse(confirmed: true));
  }

  showProgressDialog() {
    progressDialog..show(locator<NavigationService>().navigatorKey.currentState.overlay.context);
  }

  ProgressController controller;
  Flushbar progressDialog = Flushbar(
    animationDuration: normalDuration,
    maxWidth: 400,
    flushbarPosition: FlushbarPosition.TOP,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    overlayBlur: 0.1,
    progressIndicatorBackgroundColor: theme.themeColor.withOpacity(0.2),
    progressIndicatorValueColor:
        AlwaysStoppedAnimation(theme.themeColor != null ? theme.themeColor : AppTheme.themeColor),
    flushbarStyle: FlushbarStyle.FLOATING,
    overlayColor: Colors.black.withOpacity(0.15),
    isDismissible: false,
    margin: EdgeInsets.all(8),
    borderRadius: 8.0,
    boxShadows: [BoxShadow(blurRadius: 2.50, color: Colors.black38, offset: Offset.zero)],
    titleText: Text(
      'Please wait..',
      style: theme.headline6,
    ),
    messageText: Row(
      children: <Widget>[
        Text(
          'Loading information.',
          style: theme.subtitle2,
        ),
      ],
    ),
    showProgressIndicator: true,
    backgroundColor: theme.cardColor,
  );
  void dismissSheet(DialogResponse response) {
    if (_dialogCompleter != null) _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
