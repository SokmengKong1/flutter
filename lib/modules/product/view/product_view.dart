import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/modules/product/view_model/product_view_model.dart';
import 'package:pratect_product_flutter_app_at_home_tow/widget/product_cart_widget.dart';

class ProductScreen extends StatefulWidget {

  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product_Screen"),
      ),
      body: Obx(() {
        if (productViewModel.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!productViewModel.loading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              setState(() {
                productViewModel.fetchMoreAllProducts();
              });

            }
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              productViewModel.fetchAllProducts();
            },
            child: SingleChildScrollView(
              child: productViewModel.loading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: productViewModel.productList.length,
                      itemBuilder: (context, index) {
                        return ProductCartWidget(
                          products: productViewModel.productList[index],
                          backgroundColor: Colors.white,
                        );
                      }),
            ),
          ),
        );
      }),
    );
  }
}
