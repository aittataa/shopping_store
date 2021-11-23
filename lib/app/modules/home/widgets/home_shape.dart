import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/details/views/details_view.dart';
import 'package:shopping_store/app/modules/home/controllers/home_controller.dart';

class HomeShape extends StatelessWidget {
  final HomeController controller;
  final Product product;
  const HomeShape({Key? key, required this.product, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Get.to(() => DetailsView(product: product))},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.backgroundImageColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [AppConstant.boxShadow],
                image: DecorationImage(
                  image: CachedNetworkImageProvider(product.variants![0].picture!.location!
                      //AppMessage.placeHolder[0],
                      ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    splashColor: AppTheme.transparentColor,
                    highlightColor: AppTheme.transparentColor,
                    icon: Icon(
                      CupertinoIcons.cart_fill,
                      color: AppTheme.primaryIconColor.withOpacity(.75),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    splashColor: AppTheme.transparentColor,
                    highlightColor: AppTheme.transparentColor,
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: AppTheme.mainIconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "${product.name}",
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
    );
  }
}
