// To parse this JSON data, do
//
//     final ininventModel = ininventModelFromJson(jsonString);

import 'dart:convert';

IninventModel ininventModelFromJson(String str) =>
    IninventModel.fromJson(json.decode(str));

String ininventModelToJson(IninventModel data) => json.encode(data.toJson());

class IninventModel {
  IninventModel({
    this.codbod,
    this.codigob,
    this.codmp,
    this.stock,
    this.reserva,
    this.coduni,
    this.st0,
    this.sf0,
    this.prec0,
    this.marca,
    this.pedido,
    this.sf1,
  });

  String codbod;
  String codigob;
  String codmp;
  int stock;
  int reserva;
  String coduni;
  int st0;
  int sf0;
  int prec0;
  String marca;
  int pedido;
  int sf1;

  factory IninventModel.fromJson(Map<String, dynamic> json) => IninventModel(
        codbod: json["codbod"],
        codigob: json["codigob"],
        codmp: json["codmp"],
        stock: json["stock"],
        reserva: json["reserva"],
        coduni: json["coduni"],
        st0: json["st0"],
        sf0: json["sf0"],
        prec0: json["prec0"],
        marca: json["marca"],
        pedido: json["pedido"],
        sf1: json["sf1"],
      );

  Map<String, dynamic> toJson() => {
        "codbod": codbod,
        "codigob": codigob,
        "codmp": codmp,
        "stock": stock,
        "reserva": reserva,
        "coduni": coduni,
        "st0": st0,
        "sf0": sf0,
        "prec0": prec0,
        "marca": marca,
        "pedido": pedido,
        "sf1": sf1,
      };
}
