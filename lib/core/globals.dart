

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



// String baseUrl="http://10.17.10.1:9595";
String baseUrl="https://myybs.ybservice.com:6443";
late SharedPreferences globalSH;
var timeout = 200;
var lang='en';
const CACHED_USER_LANGUAGE="CACHED_USER_LANGUAGE";
const CACHED_JWT_TOKEN = 'CACHED_JWT_TOKEN';
GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
int page = 0;
int lastPage = 0;
int selectedCardIndex=0;
int? selectedLanguage = -1;

