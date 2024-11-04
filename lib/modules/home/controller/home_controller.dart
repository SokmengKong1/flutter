import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/auth/login_response.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/products/products.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/auth_respository.dart';
import '../../../models/category/Category.dart';
import '../../../repository/category_repository.dart';
import '../../../repository/product_repository.dart';

class HomeController extends GetxController {
  var loading = true.obs;
  var loadingProducts = true.obs;
  var loadingViewProducts = true.obs;
  var selectedCategory = 0.obs;
  final limit = 60;
  final cerrentPage = 1.obs;
  final isGrid = true.obs;
  List<Category> categories = <Category>[].obs;
  List<Products> products = <Products>[].obs;
  final CategoryRepository categoryRepository = CategoryRepository();
  final ProductRepository productRepository = ProductRepository();
  final AuthRepository authRepository = AuthRepository();
  var userLogin = LoginResponse().obs;

  @override
  void onInit() {
    fetchAllCategory();
    getUser();
    super.onInit();
  }

  Future fetchAllCategory() async {
    try {
      categories = [];
      loading(true);
      var list = await categoryRepository.getAllCategory();
      var all = Category(slug: "all", name: "all");
      categories.addAll(list);
      categories.add(all);
      FethAllProduct();


    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading(false);
    }
  }

  Future selectCategoryChang(int index) async {
    selectedCategory.value = index;
    if (index == 0) {
      fetchAllCategory();
    } else {
      FethAllProductBySlug(categories[index].slug ?? "");
    }
  }
  // Future viewAll()async{
  //   FethAllViewProduct();
  // }

  //GET ALL DATA
  // Future FethAllViewProduct() async {
  //   try {
  //     products = [];
  //     loadingViewProducts(true);
  //     var responseProduct = await productRepository.getViewAllProduct();
  //     products.addAll(responseProduct.products!);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     loadingViewProducts(false);
  //   }
  // }

  //GET BY DATA
  Future FethAllProduct() async {
    try {
      products = [];
      loadingProducts(true);
      var responseProduct =
          await productRepository.getAllProducts(limit, cerrentPage.value);
      products.addAll(responseProduct.products!);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingProducts(false);
    }
  }

  //GET DATA FROM SlUG
  Future FethAllProductBySlug(String slug) async {
    try {
      products = [];
      loadingProducts(true);
      var responseProduct = await productRepository.getAllProductsBySlug(
          limit, cerrentPage.value, slug);
      products.addAll(responseProduct.products!);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingProducts(false);
    }
  }

  onSelectChengGrid(bool select) {
    if (select == true) {
      isGrid.value = true;
    } else {
      isGrid.value = false;
    }
  }

  getUser() async {
    userLogin.value = await authRepository.getUserLocal();
  }
}
