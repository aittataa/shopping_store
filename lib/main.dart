import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
