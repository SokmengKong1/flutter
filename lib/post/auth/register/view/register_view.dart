import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../modules/auth/controller/auth_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
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
                "Login",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                controller: authController.usernameController.value,
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
                controller: authController.passwordController.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "password",
                    labelText: "password"),
              ),
            ),
            GestureDetector(
              onTap: () {
                authController.login();
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Obx((){
                  if(authController.loadingLogin.value){
                    return Center(
                      child: CircularProgressIndicator(color:  Colors.white),
                    );
                  }
                  return Text(
                    textAlign: TextAlign.center,
                    "Login",
                    style: TextStyle(),
                  );
                })

              ),
            ),
          ],
        ),
      ),
    );
  }
}
