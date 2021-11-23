import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_store/app/modules/home/widgets/home_body.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';
import 'package:shopping_store/app/shared/empty_box.dart';
import 'package:shopping_store/app/shared/header_button.dart';
import 'package:shopping_store/app/shared/response_error.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: MenuButton(),
        title: Image.asset(AppMessage.appLogo),
        actions: [
          HeaderButton(icon: CupertinoIcons.cart_fill, onPressed: () {}),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final Products products = controller.products.value;
            final List<Product> myList = products.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return HomeBody(
                controller: controller,
                myList: myList,
                //.where((product) {
                //return product.variants!.isNotEmpty;
                //}).toList(),
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
