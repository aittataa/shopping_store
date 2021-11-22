import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/modules/category/controllers/category_controller.dart';
import 'package:shopping_store/app/modules/product/views/product_view.dart';

class CategoryShape extends StatelessWidget {
  final CategoryController controller;
  final Category category;
  const CategoryShape({
    Key? key,
    required this.controller,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductView(
            controller: controller,
            id: category.id,
            title: category.name,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppTheme.mainColor.withOpacity(.25),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackColor,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      AppMessage.placeHolder[Random().nextInt(
                        AppMessage.placeHolder.length,
                      )],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "${category.name}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
