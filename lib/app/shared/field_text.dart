import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class FieldText extends StatelessWidget {
  final TextEditingController? controller;
  final bool state;
  final bool enabled;
  final bool obscureText;
  final IconData? icon;
  final String hint;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final dynamic onChanged;

  const FieldText({
    Key? key,
    this.controller,
    required this.hint,
    this.icon,
    this.state = true,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(1),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        enabled: enabled,
        autofocus: false,
        autocorrect: true,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        cursorColor: AppTheme.mainColor,
        style: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.75),
          fontWeight: FontWeight.w900,
          letterSpacing: 1.25,
        ),
        obscureText: obscureText,
        obscuringCharacter: AppMessage.obscuringCharacter,
        scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.fieldTextBackground,
          prefixIcon: Icon(icon, color: AppTheme.mainColor),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          suffixIcon: suffixIcon,
          //label: Text(hint),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.5),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.25,
          ),
          //border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppTheme.borderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: state ? AppTheme.clearColor : AppTheme.errorColor,
              width: 2.5,
            ),
          ),

          /*
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppTheme.borderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: state ? AppTheme.clearColor : AppTheme.errorColor,
              width: 2.5,
            ),
          ),
          */
        ),
      ),
    );
  }
}
