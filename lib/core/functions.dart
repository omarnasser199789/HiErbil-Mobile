import 'package:flutter/material.dart';
import 'package:advance_notification/advance_notification.dart';
showMessage( { required String  message,required BuildContext context,Color ? bgColor}){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AdvanceSnackBar(
        message: message,
        mode: Mode.BASIC,
        textSize: 14,
        bgColor:(bgColor!=null)?bgColor: const Color.fromRGBO(59, 58, 58, 1.0))
        .show(context);
  });
}