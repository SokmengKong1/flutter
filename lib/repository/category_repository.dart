
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/api_url.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/network_api_service.dart';
import '../models/category/Category.dart';

class CategoryRepository {
  final NetworkApiService apiService = NetworkApiService();
  Future<List<Category>> getAllCategory() async {
    List<Category> res = [];
    var response = await apiService.getApi(ApiUrl.getAllCategory);
    response.forEach((data){
      Category category = Category.fromJson(data);
      res.add(category);
    });
    return res;
  }

}
