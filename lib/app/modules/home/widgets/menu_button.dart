import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {},
      padding: EdgeInsets.zero,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: const Icon(CupertinoIcons.list_bullet_indent),
    );
  }
}
