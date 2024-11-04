import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/products/products.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/product_repository.dart';

class ProductViewModel extends GetxController {
  List<Products> productList = <Products>[].obs;
  var loading = true.obs;
  var loadingMore = false.obs;
  var currentPage = 1.obs;
  final limit = 60;
  final ProductRepository productRepository = ProductRepository();
  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  fetchAllProducts() async {
    productList = [];
    try {
      loading(true);
      currentPage.value = 1;
      var response =
          await productRepository.getAllProducts(limit, currentPage.value);
      productList.addAll(response.products!);

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading(false);
    }
  }

  fetchMoreAllProducts() async {
    try {
     // productList = [];
      loadingMore(true);
      currentPage.value += 1;
      var response =
          await productRepository.getAllProducts(limit, currentPage.value);
      productList.addAll(response.products!);

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingMore(false);
    }
  }
}
