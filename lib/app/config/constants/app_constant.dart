import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class AppConstant {
  AppConstant._();
  static const String baseUrl = "";

  /// TODO : Curves
  static const Curve curve = Curves.linearToEaseOut;

  /// TODO : Transitions
  static const Transition transitionRoute = Transition.topLevel;

  /// TODO : Durations
  static const Duration durationRoute = Duration(milliseconds: 100);
  static const Duration durationSplash = Duration(milliseconds: 1500);
  static const Duration durationAnimation = Duration(milliseconds: 1000);
  static const Duration duration = Duration(milliseconds: 1500);

  /// TODO : Screen Size
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  /// TODO : BoxShadow
  static BoxShadow boxShadow = BoxShadow(
    color: AppTheme.shadowColor.withOpacity(.1),
    blurRadius: 10,
    spreadRadius: .1,
  );
}
