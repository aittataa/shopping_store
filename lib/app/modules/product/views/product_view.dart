import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/shared/back_icon.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';
import 'package:shopping_store/app/shared/empty_box.dart';
import 'package:shopping_store/app/shared/header_button.dart';
import 'package:shopping_store/app/shared/response_error.dart';
import 'package:shopping_store/app/shared/search_bar.dart';

class ProductView extends StatefulWidget {
  final dynamic controller;
  final String? id;
  final String? title;
  const ProductView({
    Key? key,
    this.controller,
    this.id,
    this.title,
  }) : super(key: key);
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late dynamic controller;
  late String? id;
  late String? title;
  late AppResponse appResponse = AppResponse();

  get getAppResponse async {
    Future.delayed(Duration.zero, () async {
      appResponse = await controller.loadOne(widget.id!);
    });
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    id = widget.id;
    title = widget.title;
    getAppResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(onPressed: () => Get.back()),
        title: Text("$title"),
        actions: [
          HeaderButton(icon: CupertinoIcons.heart_fill, onPressed: () {}),
          HeaderButton(icon: CupertinoIcons.cart_fill, onPressed: () {}),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          if (appResponse.success) {
            final Category category = appResponse.response;
            final List<Product> myList = category.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    subtitle: SearchBar(controller: widget.controller!),
                  ),
                ],
              );
            } else {
              return EmptyBox();
            }
          } else {
            return ResponseError(response: appResponse);
          }
        } else {
          return BouncePoint();
        }
      }),
    );
  }
}
