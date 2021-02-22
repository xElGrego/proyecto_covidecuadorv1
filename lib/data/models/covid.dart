// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
    Covid({
        this.totalMuestrasPcr,
        this.totalFallecidos,
        this.totalConfirmados,
        this.totalAltaHospitalaria,
        this.totalRecuperados,
        this.totalDescartados,
    });

    int totalMuestrasPcr;
    int totalFallecidos;
    int totalConfirmados;
    int totalAltaHospitalaria;
    int totalRecuperados;
    int totalDescartados;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        totalMuestrasPcr: json["totalMuestrasPCR"],
        totalFallecidos: json["totalFallecidos"],
        totalConfirmados: json["totalConfirmados"],
        totalAltaHospitalaria: json["totalAltaHospitalaria"],
        totalRecuperados: json["totalRecuperados"],
        totalDescartados: json["totalDescartados"],
    );

    Map<String, dynamic> toJson() => {
        "totalMuestrasPCR": totalMuestrasPcr,
        "totalFallecidos": totalFallecidos,
        "totalConfirmados": totalConfirmados,
        "totalAltaHospitalaria": totalAltaHospitalaria,
        "totalRecuperados": totalRecuperados,
        "totalDescartados": totalDescartados,
    };
}
