import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/app_exception.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/api_url.dart';
import 'package:pratect_product_flutter_app_at_home_tow/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:pratect_product_flutter_app_at_home_tow/models/auth/login_response.dart';
import 'package:pratect_product_flutter_app_at_home_tow/models/post/login/Refresh_token_request.dart';
import 'package:pratect_product_flutter_app_at_home_tow/repository/post/login_repository.dart';

import '../../models/post/login/user.dart';
import '../../repository/auth_respository.dart';


class NetworkApiService extends BaseApiService {

  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      // var response = await http
      //     .get(Uri.parse(url))
      //     .timeout(Duration(seconds: 20));  // Timeout after 20 seconds
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;

        case 400:
          throw UnAuthorization();
        case 500:
          throw InternetServerException();
      }
    } on SocketException {
      throw InternetServerException();
    } on RequestTimeout {
      throw RequestTimeout();
    }
    // catch (e) {
    //   // Handle other types of exceptions
    //   print('Other error: $e');
    // }

    return responseJson;
  }

  @override
  Future postApi(String url, requestBody) async {
    //log url
    if (kDebugMode) {
      print("Get Request URL $url Body : $requestBody\n");
    }
    dynamic responseJson;

    try {
      var storage = GetStorage();
      var user =  LoginResponse.fromJson(storage.read("USER_KEY"));
      var token = "";
      var refreshToken = RefreshTokenRequest(refreshToken: user.refreshToken);
      if(null != user.refreshToken){
        token = user.accessToken ?? "";
      }
      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };
      var response = await http
          .post(Uri.parse(url),
          headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 401:
          throw UnAuthorization();
        case 500:
          throw InternetServerException();
      }
    } on SocketException {
      throw InternetServerException();
    } on RequestTimeout {
      throw RequestTimeout();
    }
    return responseJson;
  }

  // @override
  // Future loginApi(String url, requestBody) async {
  //
  //   dynamic responseJson;
  //   var headers = {
  //     "Content-Type": "application/json",
  //   };
  //   try {
  //     var response = await http
  //         .post(Uri.parse(url),
  //             headers: headers,
  //             body: jsonEncode(requestBody)) // Encode the request body
  //         .timeout(const Duration(seconds: 120));
  //     switch (response.statusCode) {
  //       case 200:
  //         responseJson = jsonDecode(response.body);
  //         break;
  //       case 401:
  //         throw UnAuthorization();
  //       case 500:
  //         throw InternetServerException();
  //       default:
  //         throw Exception(
  //             'Error occurred with status code: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw InternetServerException();
  //   } on RequestTimeout {
  //     throw RequestTimeout();
  //   }
  //   return responseJson;
  // }

  @override
  Future loginApi(String url, requestBody) async {
    dynamic responseJson;
    try {
      var headers = {
        "Content-Type": "application/json",
      };
      var response = await http
          .post(Uri.parse(url),
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20)); // Timeout after 20 seconds
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 401:
          //throw UnAuthorization();
          if(await refreshTokenApi() == true){
            print("Retry");
          }else{
            print("Logout");
          }
        case 500:
          throw InternetServerException();
      }
    } on SocketException {
      throw InternetServerException();
    } on RequestTimeout {
      throw RequestTimeout();
    }
    // catch (e) {
    //   // Handle other types of exceptions
    //   print('Other error: $e');
    // }

    return responseJson;
  }





  Future<bool> refreshTokenApi() async {
    dynamic responseJson;
    try {
      var headers = {
        "Content-Type": "application/json",
      };
      var storage = GetStorage();
      var user =  LoginResponse.fromJson(storage.read("USER_KEY"));
      var refreshToken = RefreshTokenRequest(refreshToken: user.refreshToken);
      print("${user.toJson()}");
      var response = await http
          .post(Uri.parse(ApiUrl.postRefreshToken),
          headers: headers, body: jsonEncode(refreshToken))
          .timeout(Duration(seconds: 20)); // Timeout after 20 seconds
      switch (response.statusCode) {
        case 200:
          var responseJson = User.fromJson(jsonDecode(response.body));
          var storage = GetStorage();
          storage.write("USER_KEY",responseJson.toJson());
          return true;

        case 401:
          return false;
        case 500:
          throw InternetServerException();
      }
    } on SocketException {
      throw InternetServerException();
    } on RequestTimeout {
      throw RequestTimeout();
    }
    return responseJson;
  }
}


// "username": "emilys",
// "password": "emilyspass",
