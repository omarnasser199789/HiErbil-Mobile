import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Theme/style.dart';
import 'back_button.dart';


AppBar appBarWidgetType3(String title,BuildContext context,bool backBtn,List<Widget>? actions ,Color ? color){
  return AppBar(


    title: Text(title,maxLines: 4,
      style: poppinsSemiBoldTextStyle(context: context,fontSize: 16,height: 1.5),),
    backgroundColor:(color==null)? Theme.of(context).scaffoldBackgroundColor:color,
    elevation: 0,

    centerTitle:true,
    actions:actions,

    automaticallyImplyLeading: false,




    leading:((backBtn==true))?  BackButtonWidget():null,
  );
}
