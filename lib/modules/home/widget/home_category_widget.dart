import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/home/controller/home_controller.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({super.key});

  @override
  State<HomeCategoryWidget> createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.loading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black12,
          ),
        );
      }
      return SizedBox(
        height: 40,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var category = homeController.categories[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    homeController.selectCategoryChang(index);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: homeController.selectedCategory == index
                          ? Colors.indigo
                          : Colors.blueGrey,
                      borderRadius: BorderRadius.circular(60)),
                  child: Text(category.name ?? ""),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
                width: 5,
              );
            },
            itemCount: homeController.categories.length),


      );
    });
  }
}
