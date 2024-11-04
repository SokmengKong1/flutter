import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/products/products.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/product_repository.dart';

class ProductDetailViewModel extends GetxController {
  var product = Products().obs;
  var loading = true.obs;
  final productRepository = ProductRepository();

  @override
  void onInit() {
    fetchProductById();
    super.onInit();
  }

  fetchProductById() async {
    try {
      loading(true);
      var responseProductById =
          await productRepository.getProductByID(Get.arguments ?? 0);
      product.value = responseProductById;
    } finally {
      loading(false);
    }
  }
}
