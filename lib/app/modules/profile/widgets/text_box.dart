import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class TextBox extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String hint;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final dynamic onChanged;

  const TextBox({
    Key? key,
    this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(3),
      child: Center(
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          cursorColor: AppTheme.mainColor,
          style: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
          //autofocus: true,
          obscureText: obscureText,
          obscuringCharacter: AppMessage.obscuringCharacter,
          scrollPadding: EdgeInsets.zero,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            border: InputBorder.none,
            label: Text(
              hint,
              style:
                  TextStyle(color: AppTheme.primaryTextColor.withOpacity(.5)),
            ),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.5),
              fontWeight: FontWeight.bold,
            ),
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
                color: AppTheme.mainColor,
                width: 2.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
