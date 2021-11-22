import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/modules/home/views/home_view.dart';
import 'package:shopping_store/app/modules/login/views/login_view.dart';
import 'package:shopping_store/app/modules/splash/controllers/splash_controller.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        const bool state = true;
        if (state) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
      splash: Column(
        children: [
          Expanded(
            flex: 3,
            child: BouncePoint(color: AppTheme.mainColor),
          ),
          Expanded(child: Image.asset(AppMessage.appLogo))
        ],
      ),
      //nextScreen: const HomeView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.primaryBackColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
