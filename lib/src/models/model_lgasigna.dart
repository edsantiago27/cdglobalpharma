// To parse this JSON data, do
//
//     final lgasignaModel = lgasignaModelFromJson(jsonString);

import 'dart:convert';

LgasignaModel lgasignaModelFromJson(String str) =>
    LgasignaModel.fromJson(json.decode(str));

String lgasignaModelToJson(LgasignaModel data) => json.encode(data.toJson());

class LgasignaModel {
  LgasignaModel({
    this.documento,
    this.area,
    this.codPer,
    this.fecha,
    this.tipoDoc,
    this.fechaT,
    this.lneas,
    this.unidades,
    this.valores,
    this.bodega,
    this.numPed,
  });

  String documento;
  String area;
  String codPer;
  DateTime fecha;
  String tipoDoc;
  DateTime fechaT;
  int lneas;
  int unidades;
  int valores;
  String bodega;
  String numPed;

  factory LgasignaModel.fromJson(Map<String, dynamic> json) => LgasignaModel(
        documento: json["documento"],
        area: json["area"],
        codPer: json["codPer"],
        fecha: DateTime.parse(json["fecha"]),
        tipoDoc: json["tipoDoc"],
        fechaT: DateTime.parse(json["fechaT"]),
        lneas: json["líneas"],
        unidades: json["unidades"],
        valores: json["valores"],
        bodega: json["bodega"],
        numPed: json["numPed"],
      );

  Map<String, dynamic> toJson() => {
        "documento": documento,
        "area": area,
        "codPer": codPer,
        "fecha": fecha.toIso8601String(),
        "tipoDoc": tipoDoc,
        "fechaT": fechaT.toIso8601String(),
        "líneas": lneas,
        "unidades": unidades,
        "valores": valores,
        "bodega": bodega,
        "numPed": numPed,
      };
}
