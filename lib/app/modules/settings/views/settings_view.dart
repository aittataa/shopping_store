import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shopping_store/app/modules/settings/widgets/preferences_item.dart';
import 'package:shopping_store/app/modules/settings/widgets/profile_container.dart';
import 'package:shopping_store/app/modules/settings/widgets/switch_button.dart';
import 'package:shopping_store/app/shared/back_icon.dart';
import 'package:shopping_store/app/shared/edit_button.dart';

class SettingsView extends StatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsController controller = Get.put(SettingsController());
  late bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text(AppMessage.labelSettings),
      ),
      body: Obx(() {
        final User user = controller.mainUser.value;
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          children: [
            /// TODO : Profile Bar
            ProfileContainer(controller: controller, user: user),

            /// TODO : Preferences Bar
            ListTile(
              title: Text(
                AppMessage.preferencesLabel,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.5),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primaryBackColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  PreferencesItem(
                    controller: controller,
                    icon: Ionicons.globe_outline,
                    label: AppMessage.languageLabel,
                    value: AppMessage.languageEN,
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  PreferencesItem(
                    controller: controller,
                    icon: Ionicons.moon_outline,
                    label: AppMessage.darkMoeLabel,
                    trailing: SwitchButton(
                      value: state,
                      onToggle: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                  ),
                  PreferencesItem(
                    controller: controller,
                    icon: Ionicons.notifications_outline,
                    label: AppMessage.notificationsLabel,
                    trailing: SwitchButton(
                      value: user.receiveNotification!,
                      onToggle: (value) {
                        setState(() {
                          user.updateNotifications;
                        });
                      },
                    ),
                  ),
                  PreferencesItem(
                    controller: controller,
                    icon: Ionicons.information_circle_outline,
                    label: AppMessage.helpLabel,
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  PreferencesItem(
                    controller: controller,
                    icon: Ionicons.log_out_outline,
                    label: AppMessage.logoutLabel,
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                ],
              ),
            ),

            /// TODO : Delete Account Bar
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              minVerticalPadding: 0,
              title: EditButton(
                onPressed: () {},
                controller: controller,
                label: AppMessage.deleteButton,
              ),
            ),
          ],
        );
      }),
    );
  }
}
