
import 'package:flutter/material.dart';
/// ----  Blue Theme  ----
const bluePrimary = Color(0xFFEC5252);
const blueAccent = Color(0xFF4D5BBF);
const blueBackground = Color(0xFFFFFFFF);
Color primaryColor = Color.fromRGBO(50, 151, 147, 1);
String primaryColorTypeString ="";
Color scaffoldBackgroundColorForLightTheme = const Color(0xFFF8F8F8);
Color scaffoldBackgroundColorForDarkTheme = const Color(0xFF0F0F0F);
Color cardColorForLightTheme = const Color(0xFFFFFFFF);
Color cardColorForDarkMode = const Color(0xFF2D2D2D);

/// ----  lightTheme  ----

final ThemeData appTheme = ThemeData.dark().copyWith(
  primaryColor:primaryColor,
  // useMaterial3: true,
  scaffoldBackgroundColor:scaffoldBackgroundColorForLightTheme,
  disabledColor: const Color.fromRGBO(18, 18, 18, 1),
  canvasColor: const Color.fromRGBO(18, 18, 18, 1),
  cardColor:cardColorForLightTheme, //const Color.fromRGBO(255, 255, 255, 1),
  accentColor: const Color.fromRGBO(121, 121, 121, 1),
  // cursorColor:const Color.fromRGBO(251, 250, 251, 1),
  // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.pink),
  textTheme:  Typography(platform: TargetPlatform.iOS).black,

  snackBarTheme: const SnackBarThemeData(contentTextStyle:
  TextStyle(color:Color.fromRGBO(18, 18, 18, 1), fontFamily: "taleeq-bold")
  ),


);

/// ----  DarkTheme  ----

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor:scaffoldBackgroundColorForDarkTheme,//const Color.fromRGBO(15, 15, 15, 1),
  primaryColor:primaryColor,
  // useMaterial3: true,
  disabledColor: const Color.fromRGBO(251, 250, 251, 1),
  canvasColor: Colors.white.withOpacity(0.87),
  accentColor: const Color.fromRGBO(160, 160, 160, 1),
  // cursorColor: const Color.fromRGBO(112, 112, 112, 0.5),
  cardColor: cardColorForDarkMode,//const Color.fromRGBO(45, 45, 45, 1),
  textTheme:  Typography(platform: TargetPlatform.iOS).white,
  snackBarTheme: SnackBarThemeData(contentTextStyle:
  TextStyle(color:Colors.white.withOpacity(0.87),fontFamily: "taleeq-bold")

  ),
);

/// ----  BlueTheme  ----
final blueTheme = ThemeData(
  primaryColor: bluePrimary,
  accentColor: blueAccent,
  backgroundColor: blueBackground,
  scaffoldBackgroundColor: blueBackground,
  disabledColor: const Color.fromRGBO(18, 18, 18, 1),
  canvasColor: const Color.fromRGBO(18, 18, 18, 1),
  cardColor: const Color.fromRGBO(255, 255, 255, 1),
  // cursorColor: const Color.fromRGBO(251, 250, 251, 1),
);

/// ----  Spooky Theme  ----
const spookyPrimary = Color(0xFF000000);
const spookyAccent = Color(0xFFBB86FC);
const spookyBackground = Color(0xFF4A4A4A);
final spookyTheme = ThemeData(
  primaryColor: spookyPrimary,
  accentColor: spookyAccent,
  backgroundColor: spookyBackground,
  scaffoldBackgroundColor: spookyBackground,
  disabledColor: const Color.fromRGBO(18, 18, 18, 1),
  canvasColor: const Color.fromRGBO(18, 18, 18, 1),
  cardColor: const Color.fromRGBO(255, 255, 255, 1),
  // cursorColor: const Color.fromRGBO(251, 250, 251, 1),
);

/// ----  Green Theme  ----
const greenPrimary = Color(0xFF4CAF50);
const greenAccent = Color(0xFF631739);
const greenBackground = Color(0xFFFFFFFF);
final greenTheme = ThemeData(
  primaryColor: greenPrimary,
  accentColor: greenAccent,
  backgroundColor: greenBackground,
  scaffoldBackgroundColor: greenBackground,
  disabledColor: const Color.fromRGBO(18, 18, 18, 1),
  canvasColor: const Color.fromRGBO(18, 18, 18, 1),
  cardColor: const Color.fromRGBO(255, 255, 255, 1),
  // cursorColor: const Color.fromRGBO(251, 250, 251, 1),
);

/// ----  Pink Theme  ----
const pinkPrimary = Color(0xFFE91E63);
const pinkAccent = Color(0xFF0C7D9C);
const pinkBackground = Color(0xFFFFFFFF);
final pinkTheme = ThemeData(
  primaryColor: pinkPrimary,
  accentColor: pinkAccent,
  backgroundColor: pinkBackground,
  scaffoldBackgroundColor: pinkBackground,
  disabledColor: const Color.fromRGBO(18, 18, 18, 1),
  canvasColor: Color.fromRGBO(18, 18, 18, 1),
  cardColor: const Color.fromRGBO(255, 255, 255, 1),
  // cursorColor: const Color.fromRGBO(251, 250, 251, 1),
);
