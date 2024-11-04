import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratect_product_flutter_app_at_home_tow/post/auth/login/controller/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //AuthControllers authController = Get.put(AuthControllers());
  AuthControllers authControllers = Get.put(AuthControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Logins"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "Logins",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                controller: authControllers.usernameController.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    hintText: "username",
                    labelText: "username"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                obscureText: true,
                controller: authControllers.passwordController.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "password",
                    labelText: "password"),
              ),
            ),
            GestureDetector(
              onTap: () {
                authControllers.logins();
              },
              child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Obx(() {
                    if (authControllers.loadingLogin.value) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return Text(
                      textAlign: TextAlign.center,
                      "Logins",
                      style: TextStyle(),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
