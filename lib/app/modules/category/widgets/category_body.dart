import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/modules/category/controllers/category_controller.dart';
import 'package:shopping_store/app/modules/category/widgets/category_shape.dart';

class CategoryBody extends StatelessWidget {
  final CategoryController controller;
  final List<Category> myList;
  const CategoryBody({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          gridDelegate: AppFunction.gridDelegate(
            crossAxisCount: 3,
            childAspectRatio: .64,
          ),
          itemCount: myList.length,
          itemBuilder: (context, i) {
            Category category = myList[i];
            return CategoryShape(
              controller: controller,
              category: category,
            );
          }),
    );
  }
}
