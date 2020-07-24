
import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/common/utils/utils.dart';
import '../dialog_decoration_builder.dart';
import '../../dialog_utils/dialog_model.dart';

class InputDialog extends HookWidget {
  final DialogStyle dialogStyle;
  final DialogRequest dialogRequest;
  final Function(String text) onSubmit;
  final Function (String text,String numeric) onMultiInputSubmit;
  final Function onCancel;
  final bool showKeyboard;
  InputDialog(   {this.onSubmit, this.onCancel,this.onMultiInputSubmit,

    @required this.dialogStyle,this.showKeyboard = false,
    this.dialogRequest,

  }) : super();

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    final currencyTextFieldController = useCurrencyTextFieldController();
    final textCaps = useState<bool>(false);
    final focusNode = useFocusNode();
    if (dialogRequest.initialValue != null) {
      textEditingController.text = dialogRequest.initialValue;
      if (!dialogRequest.initialValue.contains('.'))
        currencyTextFieldController.text = '${dialogRequest.initialValue}.00';
      else
        currencyTextFieldController.text = dialogRequest.initialValue;
    }
    return Container(
      height: dialogRequest.height,
      width: dialogRequest.width,
      constraints:
          BoxConstraints(maxWidth: dialogRequest.width, minWidth: dialogRequest.width, maxHeight: dialogRequest.height, minHeight: 400),
      decoration: BoxDecoration(
          boxShadow: largeShadow, borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              DialogDecoration(children: dialogStyle.dialogDecorations,),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dialogRequest.title ?? 'Enter Info',
                          style: dialogStyle.titleStyle ?? theme.headline6,
                        ),
                        Text(
                          dialogRequest.description ?? '',
                          style: dialogStyle.descriptionStyle ?? theme.textTheme.bodyText1,
                        ),
                      ],
                    ),

                    Visibility(visible: showKeyboard,
                      child: VirtualKeyboard(
                        keyboardWidth: 300,
                        textStyle: theme.textTheme.subtitle1,
                        themeColor: theme.themeColor,
                        backgroundColor: theme.cardColor,
                        borderRadius: 12,
                        showCompleter: true,
                        type: VirtualKeyboardType.numeric,
                        onKeyPress: (key) => keyboardPress(context, key),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Visibility(
                            visible: dialogRequest.cancelLabel != null,
                            child: SchemeButton(
                              buttonStyle: dialogStyle.cancelButtonStyle,
                              gradient: theme.themeGradient,
                              height: 50,
                              width: 130,
                              decoration: dialogStyle.buttonDecoration,
                              textStyle: dialogStyle.buttonLabelStyle ?? theme.button_gradient,
                              onTap: () => onCancel != null ? onCancel() : Navigator.pop(context),
                              label: dialogRequest.cancelLabel ?? '',
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SchemeButton(
                            buttonStyle: dialogStyle.confirmButtonStyle,
                            height: 50,
                            width: 120,
                            color: theme.themeColor,
                            decoration: dialogStyle.buttonDecoration,
                            textStyle: dialogStyle.buttonLabelStyle ?? theme.button_gradient,
                            label: dialogRequest.confirmLabel,
                            onTap: () => onSubmit(
                                dialogRequest.dialogType == DialogType.currency_input
                                    ? currencyTextFieldController.doubleValue.toString()
                                    : textEditingController.text),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  keyboardPress(BuildContext context,  VirtualKey key,{TextEditingController textEditingController, CurrencyTextFieldController currencyTextFieldController,VirtualKeyboardType keyboardType}){
    switch(keyboardType){
      case VirtualKeyboardType.numeric:
      return  performKeyStroke(context,key,currencyTextFieldController: currencyTextFieldController,controller: textEditingController);

      case VirtualKeyboardType.alpha_numeric:
      return  performKeyStroke(context,key,controller: textEditingController,currencyTextFieldController: currencyTextFieldController);

    }

  }
  
  performKeyStroke(BuildContext context,VirtualKey key,{TextEditingController controller,CurrencyTextFieldController currencyTextFieldController}){
     var textEditingController;
    if(dialogRequest.dialogType == DialogType.currency_input){
      textEditingController = currencyTextFieldController;
    } else  textEditingController = controller;

    switch(key.keyType){
      case VirtualKeyType.action:
      return  performAction(context,key, textEditingController,currencyTextFieldController: currencyTextFieldController,controller: controller);
      case VirtualKeyType.string:
      return  performText(key, textEditingController);
    }
  }

  performText(VirtualKey key,var textEditingController){
    textEditingController.text += key.text;
  }
  performAction(BuildContext context,VirtualKey key,var textEditingController,{TextEditingController controller,CurrencyTextFieldController currencyTextFieldController}){
    switch(key.action){
      case VirtualKeyboardKeyAction.backspace:
      return  performBackSpace(textEditingController);
      case VirtualKeyboardKeyAction.enter:
      return  performReturn(context,controller: controller,currencyTextFieldController: currencyTextFieldController);
      case VirtualKeyboardKeyAction.shift:
        break;
      case VirtualKeyboardKeyAction.space:
      return performSpace(textEditingController);

    }
  }

  performSpace(var textEditingController){
    textEditingController.text += ' ';
  }
  performReturn(BuildContext context,{TextEditingController controller,CurrencyTextFieldController currencyTextFieldController}){
    navigateBack();
    onSubmit(controller.text);
  }
  performBackSpace(var textEditingController){
    textEditingController.text.replaceFirst(
        RegExp('e'), '*', textEditingController.text.length - 1);
    textEditingController.text = textEditingController.text
        .substring(0, textEditingController.text.length - 1);
  }
}
