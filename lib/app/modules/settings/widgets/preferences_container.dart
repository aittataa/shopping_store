//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:ionicons/ionicons.dart';
//import 'package:shopping_store/app/config/messages/app_message.dart';
//import 'package:shopping_store/app/config/themes/app_theme.dart';
//import 'package:shopping_store/app/data/models/user.dart';
//import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';
//import 'package:shopping_store/app/modules/settings/widgets/preferences_item.dart';
//import 'package:shopping_store/app/modules/settings/widgets/switch_button.dart';
//
//class PreferencesContainer extends StatelessWidget {
//  final SettingsController controller;
//  final User user;
//  const PreferencesContainer({
//    Key? key,
//    required this.controller,
//    required this.user,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.all(10),
//      decoration: BoxDecoration(
//        color: AppTheme.whiteBackColor,
//        borderRadius: BorderRadius.circular(25),
//      ),
//      child: Column(
//        children: [
//          PreferencesItem(
//            controller: controller,
//            icon: Ionicons.globe_outline,
//            label: AppMessage.languageLabel,
//            value: AppMessage.languageEN,
//            trailing: Icon(CupertinoIcons.forward),
//          ),
//          PreferencesItem(
//            controller: controller,
//            icon: Ionicons.moon_outline,
//            label: AppMessage.darkMoeLabel,
//            trailing: SwitchButton(
//              value: true,
//              onToggle: (value) {},
//            ),
//          ),
//          PreferencesItem(
//            controller: controller,
//            icon: Ionicons.notifications_outline,
//            label: AppMessage.notificationsLabel,
//            trailing: SwitchButton(
//              value: true,
//              onToggle: (value) {},
//            ),
//          ),
//          PreferencesItem(
//            controller: controller,
//            icon: Ionicons.information_circle_outline,
//            label: AppMessage.helpLabel,
//            trailing: Icon(CupertinoIcons.forward),
//          ),
//          PreferencesItem(
//            controller: controller,
//            icon: Ionicons.log_out_outline,
//            label: AppMessage.logoutLabel,
//            trailing: Icon(CupertinoIcons.forward),
//          ),
//        ],
//      ),
//    );
//  }
//}
