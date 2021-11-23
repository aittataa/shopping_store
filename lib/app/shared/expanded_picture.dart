import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class ExpandedPicture extends StatelessWidget {
  final String image;
  final Widget? child;
  const ExpandedPicture({Key? key, required this.image, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: AppConstant.screenWidth * .5,
      height: AppConstant.screenWidth * .5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primaryBackColor,
        boxShadow: [AppConstant.boxShadow],
        border: Border.all(
          color: AppTheme.mainColor,
          width: 1.5,
        ),
        image: DecorationImage(
          scale: .5,
          image: CachedNetworkImageProvider(image),
        ),
      ),
      child: child,
    );
  }
}
