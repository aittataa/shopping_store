import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';

class ProgressBar extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Widget child;

  const ProgressBar({
    Key? key,
    this.inAsyncCall = false,
    this.opacity = 0.75,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      opacity: opacity,
      color: AppTheme.backgroundColor,
      progressIndicator: BouncePoint(color: AppTheme.mainColor),
      child: child,
    );
  }
}
