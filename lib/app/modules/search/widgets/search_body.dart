import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/search/controllers/search_controller.dart';
import 'package:shopping_store/app/shared/product_shape.dart';

class SearchBody extends StatelessWidget {
  final SearchController controller;
  final List<Product> myList;
  const SearchBody({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        gridDelegate: AppFunction.gridDelegate(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemCount: myList.length,
        itemBuilder: (context, i) {
          final Product product = myList[i];
          return ProductShape(
            controller: controller,
            product: product,
          );
        },
      ),
    );
  }
}
