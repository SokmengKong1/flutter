import 'package:get/get.dart';
import '../contanst/constant.dart';
class AppLanguage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      Constant.appName : 'App shop'
    },
    'km_kh': {
      Constant.appName : 'ហាងលក់អនឡាញ់',
    }
  };

}