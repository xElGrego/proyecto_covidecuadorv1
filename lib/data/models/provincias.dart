// To parse this JSON data, do
//
//     final provincias = provinciasFromJson(jsonString);

import 'dart:convert';

List<Provincias> provinciasFromJson(String str) => List<Provincias>.from(json.decode(str).map((x) => Provincias.fromJson(x)));

String provinciasToJson(List<Provincias> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provincias {
    Provincias({
        this.nombre,
        this.totalCasos,
        this.fallecidos,
        this.fallecidosProbables,
    });

    String nombre;
    int totalCasos;
    int fallecidos;
    int fallecidosProbables;

    factory Provincias.fromJson(Map<String, dynamic> json) => Provincias(
        nombre: json["nombre"],
        totalCasos: json["totalCasos"],
        fallecidos: json["fallecidos"],
        fallecidosProbables: json["fallecidosProbables"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "totalCasos": totalCasos,
        "fallecidos": fallecidos,
        "fallecidosProbables": fallecidosProbables,
    };
}
