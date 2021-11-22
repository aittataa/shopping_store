import 'package:flutter/material.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/modules/category/views/category_view.dart';
import 'package:shopping_store/app/modules/home/views/home_view.dart';
import 'package:shopping_store/app/modules/initial/widgets/navigation_bar.dart';
import 'package:shopping_store/app/modules/settings/views/settings_view.dart';

class InitialView extends StatefulWidget {
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late PageController controller = PageController();
  late int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    controller = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          Container(child: Center(child: Text(AppMessage.labelSearch))),
          CategoryView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            controller.jumpToPage(
              pageIndex,
              //duration: AppConstant.duration,
              //curve: AppConstant.curve,
            );
          });
        },
      ),
    );
  }
}
