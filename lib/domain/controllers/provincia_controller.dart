import 'package:get/get.dart';

import 'package:proyecto_covidecuador/data/models/provincias.dart';
import 'package:proyecto_covidecuador/domain/entities/services_covid.dart';


class ProvinciasController extends GetxController {
  var provincias = List<Provincias>().obs;

  @override
  void onInit() {
    fecthprovincias();
    print(provincias);
    super.onInit();
  }

  // ignore: missing_return
  Future<List<Provincias>> fecthprovincias() async {
    try {
      var provincia = await RemoteServices.fetchprovincias();
      if (provincia!= null) {
        provincias = provincia.obs;
        return provincias;
      }
    } catch (e) {
      print(e);
      // ignore: control_flow_in_finally
      return null;
    }
  }
}
