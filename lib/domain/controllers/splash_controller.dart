import 'package:get/get.dart';
import 'package:proyecto_covidecuador/ui/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 4.3.toInt()), () {
      Get.offAll(HomePage(), transition: Transition.rightToLeft);
    });
    super.onReady();
  }
}
