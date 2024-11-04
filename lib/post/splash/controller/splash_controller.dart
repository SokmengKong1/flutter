import 'dart:async';
import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/post/login_repository.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

class SplashController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  Timer? _timer;

  @override
  void onInit() {
    _startPeriodicLoginCheck();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer when controller is closed
    super.onClose();
  }

  void _startPeriodicLoginCheck() {
    // Periodically check login status every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await checkUserLogin();
    });
  }

  Future<void> checkUserLogin() async {
    var user = await _loginRepository.getUserLocal();
    if (user.accessToken != null) {
      _timer?.cancel(); // Stop checking once logged in
      Get.offAllNamed(RouteName.postRoot);
    } else {
      Get.offAllNamed(RouteName.postLogin);
    }
  }
}
