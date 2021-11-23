import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: BouncePoint(color: AppTheme.mainColor),
        ),
        Expanded(child: Image.asset(AppMessage.appLogo))
      ],
    );
  }
}
