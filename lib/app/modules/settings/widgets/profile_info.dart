import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';

class ProfileInfo extends StatelessWidget {
  final SettingsController controller;
  final User user;

  const ProfileInfo({Key? key, required this.controller, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "${user.firstname} ${user.lastname}",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "${user.email}",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.65),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
