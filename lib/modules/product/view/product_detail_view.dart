import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/product/view_model/product_detail_view_model.dart';
import 'package:pratect_product_flutter_app_at_home_tow/widget/product_cart_widget.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailViewModel productViewModel = Get.put(ProductDetailViewModel());
  ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Obx(() {
          return Text("${productViewModel.product.value.title ?? ""}");
        })),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (productViewModel.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var product = productViewModel.product.value;
          return Column(
            children: [
              ProductCartWidget(
                products: product,
                backgroundColor: Colors.white30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(product.description ?? ""),
              )
            ],
          );
        }));
  }
}
