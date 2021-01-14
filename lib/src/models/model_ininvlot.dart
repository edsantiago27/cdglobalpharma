// To parse this JSON data, do
//
//     final ininvlotModel = ininvlotModelFromJson(jsonString);

import 'dart:convert';

IninvlotModel ininvlotModelFromJson(String str) =>
    IninvlotModel.fromJson(json.decode(str));

String ininvlotModelToJson(IninvlotModel data) => json.encode(data.toJson());

class IninvlotModel {
  IninvlotModel({
    this.codbod,
    this.codmp,
    this.codigob,
    this.nlote,
    this.fechaC,
    this.fechaV,
    this.potencia,
    this.stock,
    this.reserva,
    this.coduni,
    this.st0,
    this.sf0,
    this.marca,
    this.sf1,
    this.observ,
    this.bioEq,
  });

  String codbod;
  String codmp;
  String codigob;
  String nlote;
  DateTime fechaC;
  DateTime fechaV;
  int potencia;
  int stock;
  int reserva;
  String coduni;
  int st0;
  int sf0;
  String marca;
  int sf1;
  String observ;
  int bioEq;

  factory IninvlotModel.fromJson(Map<String, dynamic> json) => IninvlotModel(
        codbod: json["codbod"],
        codmp: json["codmp"],
        codigob: json["codigob"],
        nlote: json["nlote"],
        fechaC: DateTime.parse(json["fechaC"]),
        fechaV: DateTime.parse(json["fechaV"]),
        potencia: json["potencia"],
        stock: json["stock"],
        reserva: json["reserva"],
        coduni: json["coduni"],
        st0: json["st0"],
        sf0: json["sf0"],
        marca: json["marca"],
        sf1: json["sf1"],
        observ: json["observ"],
        bioEq: json["bioEq"],
      );

  Map<String, dynamic> toJson() => {
        "codbod": codbod,
        "codmp": codmp,
        "codigob": codigob,
        "nlote": nlote,
        "fechaC": fechaC.toIso8601String(),
        "fechaV": fechaV.toIso8601String(),
        "potencia": potencia,
        "stock": stock,
        "reserva": reserva,
        "coduni": coduni,
        "st0": st0,
        "sf0": sf0,
        "marca": marca,
        "sf1": sf1,
        "observ": observ,
        "bioEq": bioEq,
      };
}
