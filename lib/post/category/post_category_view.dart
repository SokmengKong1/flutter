import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/status.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/category/post_category_view_model.dart';

class PostCategoryView extends StatelessWidget {
  var viewModel = Get.put(PostManageViewModel());
  PostCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Manage Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () {
          switch (viewModel.LoadingRequestAllCategoryStatus.value) {
            case Status.loading:
              return SizedBox(
                child: Center(child: Text("Loading DATA")),
              );
            case Status.error:
              return SizedBox(
                child: Center(child: Text("Error")),
              );
            case Status.completed:
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListTile(
                        title: Text("One ${index}"),
                        trailing: Icon(
                          Icons.edit,
                          color: Colors.indigo,
                        ),
                      ),
                    );
                  });
          }
        },
      ),
    );
  }
}
