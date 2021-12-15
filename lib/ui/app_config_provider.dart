import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeAppLanguage(String newLang) {
    if (newLang == appLanguage) return;
    appLanguage = newLang;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  void changeAppThemeMode(ThemeMode newMode) {
    if (appTheme == newMode) return;
    appTheme = newMode;
    notifyListeners();
  }
}
