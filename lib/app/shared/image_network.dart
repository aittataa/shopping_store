import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';

class ImageNetwork extends StatelessWidget {
  final String image;
  const ImageNetwork({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      progressIndicatorBuilder: (context, url, progress) {
        return BouncePoint(size: 30);
      },
      errorWidget: (context, url, error) {
        return Icon(
          CupertinoIcons.xmark_circle_fill,
          color: AppTheme.mainIconColor,
        );
      },
    );
  }
}
