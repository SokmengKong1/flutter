import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pratect_product_flutter_app_at_home_tow/cores/language/app_language.dart';
import 'package:pratect_product_flutter_app_at_home_tow/routes/app_routes.dart';

Future<void> main() async {
  await GetStorage.init();
  var storage = GetStorage();
  print("KEY_LANGUAGE ${storage.read("KEY_LANGUAGE")})");
  if(storage.read("KEY_LANGUAGE") == null ){
    storage.write("KEY_LANGUAGE", "KH");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return GetMaterialApp(
      translations: AppLanguage(), // your translations
      locale: storage.read("KEY_LANGUAGE") == "KH"
          ? Locale('km', 'KH')
          : Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: storage.read("KEY_LANGUAGE") == "KH"
          ? Locale('en', 'US')
          : Locale('km',
              'KH'), // specify the fallback locale in case an invalid locale is selected.

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.postSplash,
      getPages: AppRoute.appRoute(),
    );
  }
}
