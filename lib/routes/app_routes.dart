import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/auth/view/login_screen.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/home_screen.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/product/view/product_view.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/product/view/product_detail_view.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/auth/login/view/login_view.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/category/post_category_view.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/root/view/profile_view.dart';

import 'package:pratect_product_flutter_app_at_home_tow/post/root/view/root_view.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/splash/view/splash_view.dart';

class RouteName {
  static const String homeScreen = '/';
  static const String productScreen = '/product';
  static const String loginScreen = '/login';
  static const String productDetailView = '/product/details';
  static const String postRoot = '/post/root';
  static const String postLogin = '/post/login';
  static const String postSplash = "/post/splash";
  static const String postManageCategory = "/post/manage/categories";
  static const String profile = "/post/manage/categories/profile";
}

class AppRoute {
  static appRoute() => [
        GetPage(
          name: RouteName.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.productScreen,
          page: () => ProductScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
            name: RouteName.productDetailView,
            page: () => ProductDetailView(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.postRoot,
            page: () => RootView(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.postSplash,
            page: () => SplashView(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.postLogin,
            page: () => LoginView(),
            transition: Transition.rightToLeft),
    GetPage(
        name: RouteName.postManageCategory,
        page: () => PostCategoryView(),
        transition: Transition.rightToLeft),
    GetPage(
        name: RouteName.profile,
        page: () => ProfileView(),
        transition: Transition.rightToLeft),

      ];
}
