
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import '../dialog_model.dart';
import '../dialog_service.dart';

class CustomAlertDialog extends StatelessWidget {
	final DialogRequest request;
	final DialogService _dialogService = locator();
CustomAlertDialog({Key key, this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	  var isConfirmationDialog = request.dialogType == DialogType.confirmation;
    return Material(color:Colors.transparent,child: AlertDialog(
	    backgroundColor: theme.cardColor,
	    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
	    title: Text(
		    request.title,
		    style: theme.headline6,
	    ),
	    content: Text(
		    request.description,
		    style: theme.textTheme.bodyText1,
	    ),
	    actions: <Widget>[
		    if (isConfirmationDialog)
			    SchemeButton(
				    height: 36,
				    buttonStyle: SchemeButtonStyle.flat,
				    label: request.cancelLabel,
				    textStyle: theme.button_gradient
						    .copyWith(color: theme.cardColor.textColor.withOpacity(0.75)),
				    textColor: theme.cardColor.textColor.withOpacity(0.75),
				    onTap: () => _dialogService.dialogComplete(request,DialogResponse(confirmed: false)),
			    ),
		    SchemeButton(
			    height: 36,
			    buttonStyle: SchemeButtonStyle.flat,
			    textColor: theme.themeColor,
			    textStyle: theme.button_gradient.copyWith(color: theme.themeColor),
			    label: request.confirmLabel,
			    onTap: () => _dialogService.dialogComplete(request,DialogResponse(confirmed: true)),
		    ),
	    ],
    ),);
  }
}
