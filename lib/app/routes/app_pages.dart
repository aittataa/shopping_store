import 'package:get/get.dart';

import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/modules/category/bindings/category_binding.dart';
import 'package:shopping_store/app/modules/category/views/category_view.dart';
import 'package:shopping_store/app/modules/details/bindings/details_binding.dart';
import 'package:shopping_store/app/modules/details/views/details_view.dart';
import 'package:shopping_store/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:shopping_store/app/modules/favorite/views/favorite_view.dart';
import 'package:shopping_store/app/modules/home/bindings/home_binding.dart';
import 'package:shopping_store/app/modules/home/views/home_view.dart';
import 'package:shopping_store/app/modules/initial/bindings/initial_binding.dart';
import 'package:shopping_store/app/modules/initial/views/initial_view.dart';
import 'package:shopping_store/app/modules/login/bindings/login_binding.dart';
import 'package:shopping_store/app/modules/login/views/login_view.dart';
import 'package:shopping_store/app/modules/product/bindings/product_binding.dart';
import 'package:shopping_store/app/modules/product/views/product_view.dart';
import 'package:shopping_store/app/modules/profile/bindings/profile_binding.dart';
import 'package:shopping_store/app/modules/profile/views/profile_view.dart';
import 'package:shopping_store/app/modules/settings/bindings/settings_binding.dart';
import 'package:shopping_store/app/modules/settings/views/settings_view.dart';
import 'package:shopping_store/app/modules/splash/bindings/splash_binding.dart';
import 'package:shopping_store/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
