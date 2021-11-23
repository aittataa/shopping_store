import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/details/views/details_view.dart';
import 'package:shopping_store/app/shared/cart_button.dart';
import 'package:shopping_store/app/shared/image_network.dart';

class ProductShape extends StatelessWidget {
  final dynamic controller;
  final Product product;
  const ProductShape({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Get.to(() => DetailsView(product: product))},
      child: Container(
        decoration: BoxDecoration(
          //color: AppTheme.primaryBackColor.withOpacity(.64),
          borderRadius: BorderRadius.circular(25),
          //boxShadow: [AppConstant.boxShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundImageColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [AppConstant.boxShadow],
                    ),
                    child: ImageNetwork(
                      image: "${AppMessage.placeHolder}",
                      //image: "${product.variants![0].picture!.location!}",
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (product.discount != null)
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                color: AppTheme.secondaryBackColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "${product.discount!.discountPercent}%",
                                style: TextStyle(
                                  color: AppTheme.secondaryTextColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            )
                          else
                            SizedBox(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          CartButton(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Container(
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
              subtitle: Text(
                "${AppMessage.appCurrency}199",
                //"${product.variants!.first.price}",
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
