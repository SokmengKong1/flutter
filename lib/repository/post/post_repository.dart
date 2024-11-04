import 'package:pratect_product_flutter_app_at_home_tow/data/remote/api_url.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/network_api_service.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/post/Base_post_reques.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/post/Post_base_response.dart';

class PostRepository{
  final _api = NetworkApiService();
  Future<PostBaseResponse> getAllPostCategory(BasePostReques req)async{
    var response = await _api.postApi(ApiUrl.postCategory, req.toString());
    return PostBaseResponse.fromJson(response);
  }
}