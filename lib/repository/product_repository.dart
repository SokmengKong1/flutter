//
// import '../category/product/Product_response.dart';
// import '../data/remote/api_url.dart';
// import '../data/remote/network_api_service.dart';
//
// class ProductRepository{
//   final NetworkApiService apiService = NetworkApiService();
//   Future<ProductResponse> getAllProducts() async {
//     var response = await apiService.getApi(ApiUrl.baseUrl +ApiUrl.getAllProduct);
//     ProductResponse productResponse = ProductResponse.fromJson(response);
//     return productResponse;
//   }
// }
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/api_url.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/network_api_service.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/products/Product_response.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/products/products.dart';

class ProductRepository {
  final NetworkApiService apiService = NetworkApiService();
  Future<ProductResponse> getAllProducts(int limit, int page) async {
    var response = await apiService
        .getApi("${ApiUrl.getAllProduct}?limit=$limit&skip=$page");
    ProductResponse productResponse = ProductResponse.fromJson(response);
    return productResponse;
  }

  Future<ProductResponse> getAllProductsBySlug(
      int limit, int page, String slug) async {
    var response = await apiService
        .getApi("${ApiUrl.getAllProductByUrl}/$slug?limit=$limit&skip=$page");
    ProductResponse productResponse = ProductResponse.fromJson(response);
    return productResponse;
  }

  // Future<ProductResponse> getViewAllProduct() async {
  //   var response = await apiService.getApi(ApiUrl.getAllProduct);
  //   ProductResponse productResponse = ProductResponse.fromJson(response);
  //   return productResponse;
  // }
  Future<Products> getProductByID(int id) async {
    var response = await apiService.getApi("${ApiUrl.getAllProduct}/$id");
    return Products.fromJson(response);
  }
}

// class ProductRepository{
//   final NetworkApiService apiService = NetworkApiService();
//   Future<ProductResponse> getAllProducts(int limit, int page) async {
//     var response = await apiService.getApi("${ApiUrl.getAllProduct}?limit=$limit&page=$page");
//     ProductResponse productResponse = ProductResponse.fromJson(response);
//     return productResponse;
//   }
//
//   Future<ProductResponse> getAllProductsBySlug(int limit, int page,String slug) async {
//     var response = await apiService.getApi("${ApiUrl.getAllProductByUrl}/$slug?limit=$limit&page=$page");
//     ProductResponse productResponse = ProductResponse.fromJson(response);
//     return productResponse;
//   }
//   Future<ProductResponse> getViewAllProduct() async {
//     var response = await apiService.getApi("${ApiUrl.baseUrl}${ApiUrl.getAllProduct}");
//     ProductResponse productResponse = ProductResponse.fromJson(response);
//     return productResponse;
//   }
//   Future<Products> getProductByID(int id)async{
//     var response = await apiService.getApi(ApiUrl.getAllProduct+"/$id");
//     return Products.fromJson(response);
//   }
// }
