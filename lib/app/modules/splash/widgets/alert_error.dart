import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/modules/splash/views/splash_view.dart';

class AlertError extends StatelessWidget {
  final AppResponse response;
  const AlertError({Key? key, required this.response}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      //color: AppTheme.primaryBackColor,
      child: AlertDialog(
        //backgroundColor: AppTheme.primaryBackColor,
        titlePadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        //buttonPadding: const EdgeInsets.all(10),
        buttonPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Image.asset(AppMessage.appLogo),
        content: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Text(
            response.messageUser.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.75),
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            response.messageServer.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.5),
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: CupertinoDialogAction(
                  onPressed: () => exit(0),
                  child: Text("Close"),
                  textStyle: TextStyle(
                    color: AppTheme.errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: CupertinoDialogAction(
                  onPressed: () => Get.off(SplashView()),
                  child: Text("Try again"),
                  textStyle: TextStyle(
                    color: AppTheme.clearColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
