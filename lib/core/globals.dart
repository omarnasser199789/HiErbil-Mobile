

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error/failures.dart';



// String baseUrl="http://10.17.10.1:9595";
String baseUrl="https://hierbil.lucid-source.com";
String s3Amazonaws="https://hierbil.s3.eu-north-1.amazonaws.com/";
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


////////////////////////////////////////////////////

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
