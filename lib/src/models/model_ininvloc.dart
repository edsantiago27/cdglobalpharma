// To parse this JSON data, do
//
//     final ininvlocModel = ininvlocModelFromJson(jsonString);

import 'dart:convert';

IninvlocModel ininvlocModelFromJson(String str) =>
    IninvlocModel.fromJson(json.decode(str));

String ininvlocModelToJson(IninvlocModel data) => json.encode(data.toJson());

class IninvlocModel {
  IninvlocModel({
    this.codbod,
    this.codigob,
    this.codmp,
    this.nlote,
    this.stock,
    this.reserva,
    this.coduni,
    this.ubicacion,
  });

  String codbod;
  String codigob;
  String codmp;
  String nlote;
  int stock;
  int reserva;
  String coduni;
  String ubicacion;

  factory IninvlocModel.fromJson(Map<String, dynamic> json) => IninvlocModel(
        codbod: json["codbod"],
        codigob: json["codigob"],
        codmp: json["codmp"],
        nlote: json["nlote"],
        stock: json["stock"],
        reserva: json["reserva"],
        coduni: json["coduni"],
        ubicacion: json["ubicacion"],
      );

  Map<String, dynamic> toJson() => {
        "codbod": codbod,
        "codigob": codigob,
        "codmp": codmp,
        "nlote": nlote,
        "stock": stock,
        "reserva": reserva,
        "coduni": coduni,
        "ubicacion": ubicacion,
      };
}
