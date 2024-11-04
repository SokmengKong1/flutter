import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/controller/home_controller.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/widget/home_appbat_widget.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/widget/home_category_widget.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/widget/home_product_list_widget.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/widget/home_product_widget.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/widget/view_all.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: () async {
          homeController.fetchAllCategory();
        },
        child: Scaffold(
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppbatWidget(
                      onPressLogin: () {
                        if (homeController.userLogin.value.username != null) {
                        } else {
                          Get.toNamed(RouteName.loginScreen)!.then((onValue) {
                            if (onValue = true) {
                              homeController.getUser();
                            }
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HomeCategoryWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewAll()));
                                  },
                                  child: Text("Specail product")),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.list_alt_rounded,
                                  color: homeController.isGrid.value
                                      ? Colors.grey
                                      : Colors.blueGrey,
                                ),
                                onTap: () {
                                  homeController.onSelectChengGrid(false);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.grid_view_rounded,
                                  color: homeController.isGrid.value
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onTap: () {
                                  homeController.onSelectChengGrid(true);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  // onTap: () {
                                  //   setState(() {
                                  //     homeController.viewAll();
                                  //   });
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => ViewAll()));
                                  // },

                                  onTap: () {
                                    Get.toNamed(RouteName.productScreen);
                                  },
                                  child: Text("See all")),
                            ],
                          )
                        ],
                      ),
                    ),
                    //HomeProductWidget(),
                    homeController.isGrid.value
                        ? HomeProductWidget()
                        : HomeProductListWidget(),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
