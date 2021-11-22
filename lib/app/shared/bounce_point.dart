import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class BouncePoint extends StatelessWidget {
  final double size;
  final Color? color;

  const BouncePoint({
    Key? key,
    this.size = 64,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //if (size < 32) {
    return SpinKitSquareCircle(
      size: size,
      color: color ?? AppTheme.secondaryBackColor,
      duration: AppConstant.durationSplash,
    );
    /*} else {
      return SpinKitThreeBounce(
        size: size,
        color: AppTheme.blackBackColor.withOpacity(.5),
        duration: AppConstant.duration,
      );
    }*/
  }
}
