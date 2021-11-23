import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class AccessButton extends StatelessWidget {
  final String image;
  final Function()? onPressed;
  const AccessButton({Key? key, required this.image, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackColor, //.withOpacity(.75),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(image),
      ),
    );
  }
}
