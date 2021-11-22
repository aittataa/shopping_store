import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';

class PreferencesItem extends StatelessWidget {
  final SettingsController controller;
  final IconData icon;
  final String label;
  final String value;
  final Widget? trailing;
  const PreferencesItem({
    Key? key,
    required this.controller,
    required this.icon,
    required this.label,
    this.value = "",
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 0,
      leading: Icon(
        icon,
        color: AppTheme.primaryIconColor.withOpacity(.5),
        size: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.75),
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: trailing,
    );
  }
}
