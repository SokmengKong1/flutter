


import 'package:get_storage/get_storage.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/auth/Login_request.dart';

import '../data/remote/api_url.dart';
import '../data/remote/network_api_service.dart';
import '../models/auth/login_response.dart';

class AuthRepository{
  final _networkApiService = NetworkApiService();
  Future<LoginResponse> login(LoginRequest req) async {
    var response = await _networkApiService.postApi(ApiUrl.postAppLoginPath, req.toJson());
    LoginResponse loginResponse = LoginResponse.fromJson(response);
    saveUserLocal(loginResponse);
    return loginResponse;
  }

  Future<void> saveUserLocal(LoginResponse data) async{
    var storage = GetStorage();
    storage.write("USER_KEY", data.toJson());
  }


  Future<LoginResponse> getUserLocal()async{
    var storage = GetStorage();
    return  LoginResponse.fromJson(storage.read("USER_KEY"));
  }
}