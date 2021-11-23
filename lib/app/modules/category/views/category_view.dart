import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/modules/category/controllers/category_controller.dart';
import 'package:shopping_store/app/modules/category/widgets/category_body.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';
import 'package:shopping_store/app/shared/empty_box.dart';
import 'package:shopping_store/app/shared/header_button.dart';
import 'package:shopping_store/app/shared/response_error.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessage.labelCategories),
        actions: [
          HeaderButton(icon: CupertinoIcons.cart_fill, onPressed: () {}),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final Categories categories = controller.categories.value;
            final List<Category> myList = categories.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return CategoryBody(
                controller: controller,
                myList: myList,
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
