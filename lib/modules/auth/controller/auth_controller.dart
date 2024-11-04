

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/app_exception.dart';
import '../../../models/auth/Login_request.dart';
import '../../../repository/auth_respository.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loadingLogin = false.obs;
  var authRepository = AuthRepository();

  Future<void> login() async {
    if (usernameController.value.text.isEmpty) {
      Get.snackbar("Error", "please enter your username");
      return;
    }
    if (passwordController.value.text.isEmpty) {
      Get.snackbar("Error", "please enter your passwords");
      return;
    }
    loadingLogin(true);
    try {
      var req = LoginRequest(
          username: usernameController.value.text,
          password: passwordController.value.text,
         );
       await authRepository.login(req);
       Get.back(result: true);
    }on UnAuthorization {
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
