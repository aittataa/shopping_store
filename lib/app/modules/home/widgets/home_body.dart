import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_store/app/modules/home/widgets/home_shape.dart';

class HomeBody extends StatelessWidget {
  final HomeController controller;
  final List<Product> myList;
  const HomeBody({
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
          childAspectRatio: 0.64,
        ),
        itemCount: myList.length,
        itemBuilder: (context, i) {
          final Product product = myList[i];

          return HomeShape(
            controller: controller,
            product: product,
          );
        },
      ),
    );
  }
}
