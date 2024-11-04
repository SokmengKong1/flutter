import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pratect_product_flutter_app_at_home_tow/cores/contanst/constant.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/controller/home_controller.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

class HomeAppbatWidget extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  VoidCallback onPressLogin;
  HomeAppbatWidget({super.key, required this.onPressLogin});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view_rounded),
            style: IconButton.styleFrom(
                backgroundColor: Colors.black12, iconSize: 32),
          ),

          Text(Constant.appName.tr),
          //Image.asset('assets/english.png',width: 30,height: 30,),
          Row(
            children: [
              GestureDetector(
                onTap: onPressLogin,
                child: Obx(

                  () {
                    return Container(
                      child: homeController.userLogin.value.username != null
                          ? Text(
                              "${homeController.userLogin.value.username}",
                              style: const TextStyle(color: Colors.indigo),
                            )
                          : Text("Login".tr),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  if (storage.read("KEY_LANGUAGE") == "KH") {
                    var locate = const Locale('en', 'US');
                    Get.updateLocale(locate);
                    storage.write("KEY_LANGUAGE", "US");
                  } else {
                    var locate = const Locale('km', 'KH');
                    Get.updateLocale(locate);
                    storage.write("KEY_LANGUAGE", "KH");
                  }
                },
                child: Image.asset(
                  storage.read("KEY_LANGUAGE") == "KH"
                      ? Constant.PathImageKh
                      : Constant.PathImageEl,
                  width: 30,
                  height: 50,
                ),
              ),
            ],
          ),
          // Image.asset(
          //   Constant.ImageKhmer,
          //   width: 40,
          //   height: 40,
          // ),
          // Image.asset("assets/images/icons/english.png"),

          // IconButton(onPressed: (){

          //
          // }, icon: Icon(Icons.no_accounts_outlined),
          //   style: IconButton.styleFrom(
          //       backgroundColor: Colors.black12,iconSize: 32
          //   ),
          //)
        ],
      ),
    );
  }
}
