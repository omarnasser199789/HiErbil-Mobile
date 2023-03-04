


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Theme/style.dart';
import 'back_button.dart';


AppBar appBarWidget(String title,BuildContext context,bool backBtn,List<Widget>? actions ,Color ? color){
 return AppBar(
   // systemOverlayStyle: SystemUiOverlayStyle(
   //   // Status bar color
   //   statusBarColor: Colors.red,
   //
   //   // Status bar brightness (optional)
   //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
   //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
   // ),


    title: Text(title,maxLines: 4,
      style: blackBoldTextStyle(context: context,fontSize: 15,height: 1.5),),
    backgroundColor:(color==null)? Theme.of(context).scaffoldBackgroundColor:color,
    elevation: 0,

    centerTitle:true,
    actions:actions,

   automaticallyImplyLeading: false,




    leading:((backBtn==true))?  BackButtonWidget():null,
  );
}



Future<dynamic> goTo(BuildContext context, WidgetBuilder builder) async {

  var res= await Navigator.push(
    context,
    MaterialPageRoute(builder:builder),
  );
  return res;
}