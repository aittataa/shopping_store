import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class CartButton extends StatelessWidget {
  final Function()? onPressed;
  const CartButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(
          CupertinoIcons.cart_fill,
          color: AppTheme.secondaryIconColor,
        ),
      ),
    );
  }
}
