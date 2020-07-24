import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import '../dialog_model.dart';

class InputFieldsView extends HookWidget {
	final DialogStyle dialogStyle;
	final DialogRequest dialogRequest;
	final bool enableTwoFields;
	InputFieldsView(  {this.dialogStyle, this.dialogRequest,this.enableTwoFields,}) : super();

  @override
  Widget build(BuildContext context) {
	  final textController = useTextEditingController();
	  final numericController = useTextEditingController();
	  final textFocus = useFocusNode();
	  final numericFocus = useFocusNode();
	  final finishedNotifier = useState<bool>(false);
    return Material(color:Colors.transparent,child: Column(crossAxisAlignment: CrossAxisAlignment.center,  children: [
	    AnimatedContainer(duration: normalDuration,
			    width: dialogRequest.textFieldWidth,
			    margin: EdgeInsets.only(bottom: 24),
			    child: textField(context,finishedNotifier, textFocus, textController, Boxicons.bxEdit)
	    ),
	    AnimatedContainer(duration: normalDuration,
			    width: dialogRequest.textFieldWidth,
			    height: enableTwoFields && finishedNotifier.value ? 404 : 0,
			    margin: EdgeInsets.only(bottom: 24),
			    child: textField(context,finishedNotifier, numericFocus, numericController, Boxicons.bxEdit)
	    ),
    ],),);
  }

  textField(BuildContext context,ValueNotifier finishedNotifier, FocusNode focusNode,var textEditingController,IconData iconData){
  	return SchemeTextField(
		  fieldStyle: dialogStyle.formFieldStyle,
		  focusNode: focusNode,
		  controller: textEditingController,
		  currencyController: dialogRequest.dialogType == DialogType.currency_input
				  ? textEditingController
				  : null,
		  themeColor: theme.themeColor,
		  inputType: dialogRequest.inputType,
		  iconData: dialogRequest.iconData ?? Boxicons.bxEdit,
		  label: dialogRequest.inputLabel,
		  textStyle: theme.subtitle1,
		  onGainedFocus: () => finishedNotifier.value = false,
		  onSubmit: (text) => finishedNotifier.value = true,
		  inputAction: TextInputAction.done,
		  backgroundColor: theme.cardColor,
		  hintColor: theme.cardColor.textColor.withOpacity(0.75),
		  textColor: theme.cardColor.textColor,
		  decoration: theme.textFieldDecoration,
		  textCapitalization: dialogRequest.textCapitalization,
	  );
  }
}
