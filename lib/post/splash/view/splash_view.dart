import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  var splashController = Get.put(SplashController());
   SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child:  Text("First Screen"),
      ),
    );
  }
}
