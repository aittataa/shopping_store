import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/modules/initial/views/initial_view.dart';
import 'package:shopping_store/app/modules/splash/controllers/splash_controller.dart';
import 'package:shopping_store/app/modules/splash/widgets/splash.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        //final AppResponse appResponse = await controller.loadApp;
        return InitialView();
        /*
        if (appResponse.success) {
          String id = "a1f8e073e-527b-4bdc-a953-3eacc9d2e58c";
          final AppResponse appResponse = await controller.loadUser(id);
          if (appResponse.success) {
            AppResponse.mainUser = appResponse.response;
            return InitialView();
          } else {
            return LoginView();
          }
        } else {
          return AlertError(response: appResponse);
        }
        */
      },
      splash: Splash(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.primaryBackColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
