import 'package:get/get.dart';
import 'package:proyecto_covidecuador/data/models/covid.dart';
import 'package:proyecto_covidecuador/domain/entities/services_covid.dart';

class CovidController extends GetxController {
  var covid = Covid().obs;

  @override
  void onInit() {
    fetchCovids();
    print(covid);
    super.onInit();
  }

  // ignore: missing_return
  Future<Covid> fetchCovids() async {
    try {
      var covidsito = await RemoteServices.fetchCovid();
      if (covidsito != null) {
        covid.value = covidsito;
        return covid.value;
      }
    } catch (e) {
      print(e);
      // ignore: control_flow_in_finally
      return null;
    }
  }
}
