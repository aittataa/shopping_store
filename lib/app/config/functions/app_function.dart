import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class AppFunction {
  AppFunction._();

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.errorColor,
      titleText: Text(
        title,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }

  static isWillPop(context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        insetAnimationDuration: AppConstant.durationSplash,
        insetAnimationCurve: AppConstant.curve,
        title: Text(
          AppMessage.appTitle,
          style: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        content: Text(
          "Are You Sure You Want To Exit ?",
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("No"),
            textStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Yes"),
            textStyle: TextStyle(
              color: AppTheme.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static animateToPage(int index) {
    AppConstant.pageIndex = index;
    AppConstant.controller.jumpToPage(
      AppConstant.pageIndex,
    );
  }

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

  static isNameValid(String value) {
    return GetUtils.isLengthGreaterOrEqual(value, 3);
  }

  static isEmailValid(String email) {
    return GetUtils.isEmail(email);
  }

  static isPasswordValid(String password) {
    return GetUtils.isLengthGreaterThan(
      password, 10,
      //r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{10,}$",
      //r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,}$",
    );
  }
}
