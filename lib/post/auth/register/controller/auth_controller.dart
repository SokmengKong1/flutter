import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/post/login_repository.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

import '../../../../../../data/app_exception.dart';


class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loadingLogin = false.obs;
  var _loginReposoitory = LoginRepository();

  Future<void> login() async {
    if (usernameController.value.text.isEmpty) {
      Get.snackbar("Error", "please enter your username");
      return;
    }
    if (passwordController.value.text.isEmpty) {
      Get.snackbar("Error", "please enter your password");
      return;
    }
    loadingLogin(true);
    try {
      var response = await _loginReposoitory.login(
        username: usernameController.value.text,
        password: passwordController.value.text,
      );
      Get.offAllNamed(RouteName.postSplash);
      _loginReposoitory.saveUserLocal(response);
    } on UnAuthorization {
      Get.snackbar("Error", "your username and password incorrect!");
    }
    // catch (e) {
    //   Get.snackbar("Error", e.toString());
    // }
    finally {
      loadingLogin(false);
    }
  }
}
