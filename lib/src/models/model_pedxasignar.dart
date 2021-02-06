// To parse this JSON data, do
//
//     final modelsPedidosxAsignar = modelsPedidosxAsignarFromJson(jsonString);

import 'dart:convert';

ModelsPedidosxAsignar modelsPedidosxAsignarFromJson(String str) =>
    ModelsPedidosxAsignar.fromJson(json.decode(str));

String modelsPedidosxAsignarToJson(ModelsPedidosxAsignar data) =>
    json.encode(data.toJson());

class ModelsPedidosxAsignar {
  ModelsPedidosxAsignar({
    this.folio,
    this.unidades,
    this.status,
    this.numPed,
    this.estado,
    this.tipo,
    this.identificador,
    this.apellidos,
    this.direc,
    this.lineas,
    this.bodega,
    this.retenido,
    this.fecha,
    this.tipoCli,
    this.desTcli,
    this.interno,
  });

  String folio;
  int unidades;
  String status;
  String numPed;
  String estado;
  String tipo;
  String identificador;
  String apellidos;
  String direc;
  int lineas;
  String bodega;
  int retenido;
  DateTime fecha;
  String tipoCli;
  String desTcli;
  String interno;

  factory ModelsPedidosxAsignar.fromJson(Map<String, dynamic> json) =>
      ModelsPedidosxAsignar(
        folio: json["folio"],
        unidades: json["unidades"],
        status: json["status"],
        numPed: json["numPed"],
        estado: json["estado"],
        tipo: json["tipo"],
        identificador: json["identificador"],
        apellidos: json["apellidos"],
        direc: json["direc"],
        lineas: json["lineas"],
        bodega: json["bodega"],
        retenido: json["retenido"],
        fecha: DateTime.parse(json["fecha"]),
        tipoCli: json["tipoCli"],
        desTcli: json["desTcli"],
        interno: json["interno"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "unidades": unidades,
        "status": status,
        "numPed": numPed,
        "estado": estado,
        "tipo": tipo,
        "identificador": identificador,
        "apellidos": apellidos,
        "direc": direc,
        "lineas": lineas,
        "bodega": bodega,
        "retenido": retenido,
        "fecha": fecha.toIso8601String(),
        "tipoCli": tipoCli,
        "desTcli": desTcli,
        "interno": interno,
      };
}
