import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/post/Base_post_reques.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/post/post_category.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/post/post_repository.dart';

import '../../data/status.dart';

class PostManageViewModel extends GetxController {
  final _repository = PostRepository();
  var categoriesList = <PostCategory>[].obs;
  var LoadingRequestAllCategoryStatus = Status.loading.obs;
  void setLoadingRequestAllCategory(Status value) =>
      LoadingRequestAllCategoryStatus.value = value;
  var baseRequest = BasePostReques().obs;

  @override
  void onInit() {
    LoadingCategoryData();
    super.onInit();
  }
  LoadingCategoryData() async {
    setLoadingRequestAllCategory(Status.loading);
    await _fetchAllCategory();
    setLoadingRequestAllCategory(Status.completed);
  }
  _fetchAllCategory() async {
    try{
      var response = await _repository.getAllPostCategory(baseRequest.value);
      response.data?.forEach((data) {
        categoriesList.add(PostCategory.fromJson(data));
      });
    }catch (e){
      setLoadingRequestAllCategory(Status.error);
      Get.snackbar("Error", e.toString());
    }

  }
}
