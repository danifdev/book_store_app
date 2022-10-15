import 'package:books/app/constants/constants.dart';
import 'package:books/presentation/theme/dark.dart';
import 'package:books/presentation/theme/light.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get instance => AppTheme._internal();

  late ThemeData light;
  late ThemeData dark;

  AppTheme._internal();

  ThemeData get(AppThemeType type) {
    switch (type) {
      case AppThemeType.dark:
        return darkThemeOf(AppColors.black);
      case AppThemeType.light:
        return lightThemeOf(AppColors.lightBlue);
    }
  }
}

enum AppThemeType { light, dark }

extension AddOn on AppThemeType {
  String get string {
    switch (this) {
      case AppThemeType.light:
        return 'Light';
      case AppThemeType.dark:
        return 'Dark';
    }
  }
}
