import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/modules/settings/controllers/settings_controller.dart';

class ProfileImage extends StatelessWidget {
  final SettingsController controller;
  final String image;
  const ProfileImage({Key? key, required this.controller, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primaryBackColor,
        boxShadow: [AppConstant.boxShadow],
        border: Border.all(
          color: AppTheme.mainColor,
          width: 1.5,
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(image),
        ),
      ),
    );
  }
}
