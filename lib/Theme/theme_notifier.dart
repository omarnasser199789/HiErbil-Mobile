

import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/theme_values.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = blueTheme;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}