import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controller/home_controller.dart';
class ViewAll extends StatefulWidget {
  const ViewAll({super.key});
  @override
  State<ViewAll> createState() => _ViewAllState();
}
class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
      ),
      body:Obx((){
        if(homeController.loading.value){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black12,
            ),
          );
        }
        return  SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 1,
                ),
                // Place your Text widget here
                Padding(
                  padding: const EdgeInsets.only(top: 16),

                  child: Text(
                    "Product List", // Add your desired text here
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // child: HomeCategoryWidget(),
                ),
                // Your existing Container with Obx logic
                Container(
                  child: Obx(
                        () {
                      if (homeController.loadingViewProducts.value) {
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
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              var products = homeController.products[index];
                              return Center(
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
                                        child: Image.network(
                                          products.thumbnail ?? "",
                                          fit: BoxFit.cover,
                                          height: 120,
                                        ),
                                      ),
                                      Text(
                                        products.title ?? "",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$ ${products.price}",
                                              style: TextStyle(color: Colors.red),
                                            ),
                                            Text(
                                              "View: ${products.reviews!.length}",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 10),
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
                  ),
                ),
              ],
            ),
          ),
        );
      })

    );
  }
}
