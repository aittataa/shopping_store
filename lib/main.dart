import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      initialRoute: AppPages.initial,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      getPages: AppPages.routes,
    );
  }
}
