import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shopping_store/app/modules/settings/widgets/profile_image.dart';
import 'package:shopping_store/app/modules/settings/widgets/profile_info.dart';
import 'package:shopping_store/app/routes/app_pages.dart';
import 'package:shopping_store/app/shared/edit_button.dart';

class ProfileContainer extends StatelessWidget {
  final SettingsController controller;
  final User user;
  const ProfileContainer({
    Key? key,
    required this.controller,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          ProfileImage(controller: controller, image: user.imageUrl!),
          ProfileInfo(controller: controller, user: user),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            minVerticalPadding: 0,
            title: EditButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              controller: controller,
              label: AppMessage.editButton,
            ),
          ),
        ],
      ),
    );
  }
}
