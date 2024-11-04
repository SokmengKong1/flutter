import 'package:get_storage/get_storage.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/api_url.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/network_api_service.dart';
import '../../models/post/login/Login_rep.dart';
import '../../models/post/login/Login_req.dart';

class LoginRepository {
  final _api = NetworkApiService();

  Future<LoginRep> login({String? username, String? password}) async {
    var requestBody = LoginReq(phoneNumber: username, password: password);
    var response =
        await _api.loginApi(ApiUrl.postAppLoginPath, requestBody.toJson());
    return LoginRep.fromJson(response);
  }

  Future<void> saveUserLocal(LoginRep data) async {
    var storage = GetStorage();
    storage.write("USER_KEY", data.toJson());
  }
  Future<void> removeUserLocal() async {
    var storage = GetStorage();
    storage.remove("USER_KEY");
  }


  Future<LoginRep> getUserLocal() async {
    LoginRep response = LoginRep();
    var storage = GetStorage();
    var user = storage.read("USER_KEY");
    if (user != null) {
      response = LoginRep.fromJson(user);
    }
    return response;
  }
}
