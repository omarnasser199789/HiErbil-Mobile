import 'package:flutter/material.dart';

import '../core/globals.dart';


// Color searchIconColor=const Color.fromRGBO(200, 200, 200, 0.5);
Color hintTextColor= const   Color.fromRGBO(121, 121, 121, 1);
Color iconsColor= const   Color.fromRGBO(121, 121, 121, 1);// Color.fromRGBO(154, 154, 161, 1);
Color borderColor= const  Color.fromRGBO(221, 221, 221, 1);
Color secondaryColor=const  Color.fromRGBO(250, 250, 250, 1);
const Color kMainColor =     Color.fromRGBO(38, 96, 164, 1);
const Color percentIndicatorColor = Color.fromRGBO(135, 193, 58, 1);
const Color activeColor =   Color.fromRGBO(226, 115, 91, 1);
Color textFormFieldFillColor =  Colors.grey.withOpacity(0.15);


Decoration selectDecoration =  BoxDecoration(
  color: Colors.white.withOpacity(0.01),
  border: Border.all(width: 1,color: Colors.grey.withOpacity(0.5)),
  borderRadius: BorderRadius.circular(6),
);

TextStyle whiteBoldTextStyle (double fontSize){
  return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontFamily:
      "taleeq-bold");
}

TextStyle blackBoldTextStyle ({required double fontSize,required BuildContext context,Color ? color,double ? height}){
  return TextStyle(

      color:(color!=null)?color: Theme.of(context).canvasColor,//Colors.black,
      fontSize: fontSize,
      height: (height!=null)?height:0,

      fontFamily:
      "taleeq-bold");
}

TextStyle poppinsMediumTextStyle ({required double fontSize,required BuildContext context,Color ? color,double ? height,TextDecoration? decoration}){
  return TextStyle(

      color:(color!=null)?color: Theme.of(context).canvasColor,//Colors.black,
      fontSize: fontSize,
      height: (height!=null)?height:0,
      decoration: decoration,
      fontFamily: "PoppinsMedium");
}

TextStyle poppinsSemiBoldTextStyle ({required double fontSize,required BuildContext context,Color ? color,double ? height}){
  return TextStyle(

      color:(color!=null)?color: Theme.of(context).canvasColor,//Colors.black,
      fontSize: fontSize,
      height: (height!=null)?height:0,
      fontFamily: "PoppinsSemiBold");
}

TextStyle poppinsRegularTextStyle ({required double fontSize,required BuildContext context,Color ? color,double ? height}){
  return TextStyle(

      color:(color!=null)?color: Theme.of(context).canvasColor,//Colors.black,
      fontSize: fontSize,
      height: (height!=null)?height:0,

      fontFamily: "PoppinsRegular");
}


TextStyle blackRegularTextStyle ( {required double fontSize,double ? height,}){
  return TextStyle(
    color: iconsColor,
      fontSize: fontSize,
      height: (height!=null)?height:0,
      fontFamily:
      "taleeq-regular");

}
