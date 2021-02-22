import 'package:http/http.dart' as http;
import 'package:proyecto_covidecuador/data/models/covid.dart';
import 'package:proyecto_covidecuador/data/models/provincias.dart';

class RemoteServices {
  //http.Client La interfaz para clientes HTTP que se encargan de mantener conexiones
  // persistentes a través de varias solicitudes al mismo servidor.

  //Static quiere decir que esa variable no cambiará su valor.
  static const url = 'https://api-covid-ecuador.herokuapp.com/api/total-casos/';
  static const url1 = 'https://api-covid-ecuador.herokuapp.com/api/provincias/';

  static var client = http.Client();

  static Future<Covid> fetchCovid() async {
    //Estamos obteniendo la respuesta de la pagina web
    var response = await client.get(url);

    //statuscode == 200
    //El status code 200 es un código de estado que nos dice que la petición que
    //acabamos de hacer ha sido entendida, enviada y recibida.
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      print("Conexion exitosa!!!");
      print(jsonstring);
      print("Fin de los datos");
      return covidFromJson(jsonstring);
    } else {
      print('Error ñaño, está mal la dirección');
      return null;
    }
  }

  static Future<List<Provincias>> fetchprovincias() async {
    //Estamos obteniendo la respuesta de la pagina web
    var response = await client.get(url1);

    //statuscode == 200
    //El status code 200 es un código de estado que nos dice que la petición que
    //acabamos de hacer ha sido entendida, enviada y recibida.
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      print("Conexion exitosa!!!");
      print(jsonstring);
      print("Fin de los datos");
      return provinciasFromJson(jsonstring);
    } else {
      print('Error ñaño, está mal la dirección');
      return null;
    }
  }
}
