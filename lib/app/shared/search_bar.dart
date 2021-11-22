import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class SearchBar extends StatelessWidget {
  final GetxController controller;
  const SearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: TextField(
        cursorColor: AppTheme.mainColor,
        style: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.75),
          fontWeight: FontWeight.w900,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: AppTheme.mainColor,
          ),
          hintText: AppMessage.searchHint,
          hintStyle: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
