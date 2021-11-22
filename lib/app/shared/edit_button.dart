import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class EditButton extends StatelessWidget {
  final GetxController controller;
  final String label;
  final Function()? onPressed;
  const EditButton({
    Key? key,
    required this.controller,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      elevation: 0,
      highlightElevation: 0,
      color: AppTheme.mainColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
    );
  }
}
