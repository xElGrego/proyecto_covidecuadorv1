import 'package:get/get.dart';
import 'package:proyecto_covidecuador/ui/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(HomePage(), transition: Transition.rightToLeft);
    });
    super.onReady();
  }
}
