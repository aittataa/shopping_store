import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/light/light_theme.dart';

class AppTheme {
  AppTheme._();

  //static bool isLightMode({ThemeMode mode = ThemeMode.light}) => mode == ThemeMode.light;

  static const Color clearColor = Color(0xff08ff00);
  static const Color errorColor = Color(0xfffd0000);

  static Color mainColor = LightTheme.mainColor;
  static Color backgroundColor = LightTheme.backgroundColor;
  static Color backgroundImageColor = LightTheme.backgroundImageColor;
  static Color primaryBackColor = LightTheme.primaryBackColor;
  static Color secondaryBackColor = LightTheme.secondaryBackColor;
  static Color transparentColor = LightTheme.transparentColor;
  static Color shadowColor = LightTheme.shadowColor;
  static Color borderColor = LightTheme.borderColor;

  /// TODO : Icons
  static Color mainIconColor = LightTheme.mainIconColor;
  static Color primaryIconColor = LightTheme.primaryIconColor;
  static Color secondaryIconColor = LightTheme.secondaryIconColor;

  /// TODO : Field Text Colors
  static const Color fieldTextBackground = LightTheme.fieldTextBackground;

  /// TODO : Texts
  static Color primaryTextColor = LightTheme.primaryTextColor;
  static Color secondaryTextColor = LightTheme.secondaryTextColor;

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      primaryColor: AppTheme.backgroundColor,
      splashColor: AppTheme.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        titleTextStyle: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.65),
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: AppTheme.primaryIconColor,
          opacity: .75,
        ),
      ),
    );
  }
}
