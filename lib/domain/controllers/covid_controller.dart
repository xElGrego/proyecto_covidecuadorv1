import 'package:get/get.dart';
import 'package:proyecto_covidecuador/data/models/covid.dart';
import 'package:proyecto_covidecuador/domain/entities/services_covid.dart';

class CovidController extends GetxController {
  var covid = Covid().obs;
  var covidloading = true.obs;

  @override
  void onInit() {
    fetchCovids();
    super.onInit();
  }

  // ignore: missing_return
  Future<Covid> fetchCovids() async {
    try {
      covidloading.value = true;
      var covidsito = await RemoteServices.fetchCovid();
      if (covidsito != null) {
        covid.value = covidsito;
        return covid.value;
      } else {
        print(null);
      }
    } finally {
      covidloading.value = false;
    }
    update();
  }
}
