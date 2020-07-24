import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheme_package/scheme_package.dart';

 class ProgressController {
 	final Flushbar flushbar;
	ProgressController(this.flushbar){
		flushbar..onStatusChanged = (status) {
			switch(status){
				case FlushbarStatus.SHOWING:
					break;
				case FlushbarStatus.DISMISSED:
					return Get.back();
				case FlushbarStatus.IS_APPEARING:
					break;
				case FlushbarStatus.IS_HIDING:
					break;
			}
		};
	}
	dismiss() => flushbar.dismiss();
}
class ProgressDialog extends StatefulWidget {
	final Flushbar flushbar;
	final ProgressController controller;
  const ProgressDialog({Key key, this.flushbar, this.controller}) : super(key: key);
  @override
  _ProgressDialogState createState() => _ProgressDialogState();


}

class _ProgressDialogState extends State<ProgressDialog> {
	Flushbar get flushbar => widget.flushbar;
	@override
  void initState() {
    // TODO: implement initState
    super.initState();
    flushbar.show(context);

    }
  @override
  Widget build(BuildContext context) {
    return Material(color:Colors.transparent,);
  }
}
