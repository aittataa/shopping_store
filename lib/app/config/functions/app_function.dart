import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class AppFunction {
  AppFunction._();

  static gridDelegate({
    int crossAxisCount = 1,
    double spacing = 10,
    double childAspectRatio = 1,
  }) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
    );
  }

  static configureDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.primaryBackColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
