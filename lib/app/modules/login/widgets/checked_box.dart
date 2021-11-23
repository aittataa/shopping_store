import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class CheckedBox extends StatelessWidget {
  final bool state;
  final double? size;
  final Function()? onTap;
  const CheckedBox({Key? key, this.state = true, this.size = 20, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstant.durationCheckedBox,
        curve: AppConstant.curve,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: state ? AppTheme.mainColor : AppTheme.transparentColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.mainColor,
            width: 2,
          ),
        ),
        child: Icon(
          CupertinoIcons.checkmark,
          size: size,
          color:
              state ? AppTheme.secondaryIconColor : AppTheme.transparentColor,
        ),
      ),
    );
  }
}
