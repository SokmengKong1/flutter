import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

import '../controller/home_controller.dart';

class HomeProductWidget extends StatelessWidget {
  HomeProductWidget({super.key,});

  @override
  Widget build(BuildContext context) {

    final homeController = Get.put(HomeController());
    return Obx(
      () {
        if (homeController.loadingProducts.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black12,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: GridView.builder(
              itemCount: homeController.products.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var products = homeController.products[index];
                return
                  Center(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: ((){
                              Get.toNamed("${RouteName.productDetailView}",arguments: products.id);
                            }),
                            child: Image.network(
                              products.thumbnail ?? "",
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                          ),
                        ),
                        Text(
                          products.title ?? "",
                          style: TextStyle(fontSize: 11),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${products.price}",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                "View: ${products.reviews!.length}",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
