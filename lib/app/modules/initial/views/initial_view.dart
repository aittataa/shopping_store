import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/modules/category/views/category_view.dart';
import 'package:shopping_store/app/modules/home/views/home_view.dart';
import 'package:shopping_store/app/modules/initial/widgets/navigation_bar.dart';
import 'package:shopping_store/app/modules/search/views/search_view.dart';
import 'package:shopping_store/app/modules/settings/views/settings_view.dart';

class InitialView extends StatefulWidget {
  final int id;
  const InitialView({Key? key, this.id = 0}) : super(key: key);
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  void initState() {
    super.initState();
    AppConstant.pageIndex = widget.id;
    AppConstant.controller = PageController(initialPage: AppConstant.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: AppConstant.controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          SearchView(),
          CategoryView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: AppConstant.pageIndex,
        onTap: (index) {
          setState(() {
            AppFunction.animateToPage(index);
          });
        },
      ),
    );
  }
}
