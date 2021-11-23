import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/search/controllers/search_controller.dart';
import 'package:shopping_store/app/modules/search/widgets/search_body.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';
import 'package:shopping_store/app/shared/empty_box.dart';
import 'package:shopping_store/app/shared/header_button.dart';
import 'package:shopping_store/app/shared/response_error.dart';
import 'package:shopping_store/app/shared/search_bar.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchController controller = Get.put(SearchController());
  final TextEditingController searchController = TextEditingController();
  late String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: BackIcon(
        //  onPressed: () {
        //    setState(() {
        //      AppFunction.animateToPage(0);
        //    });
        //  },
        //),
        title: Text(AppMessage.labelSearch),
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
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    title: SearchBar(
                      onChanged: (value) {
                        setState(() => {searchValue = value});
                      },
                      searchController: searchController,
                    ),
                  ),
                  SearchBody(
                    controller: controller,
                    myList: myList,
                    //.where((product) {
                    //return product.name!.contains(searchValue);
                    //}).toList(),
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
