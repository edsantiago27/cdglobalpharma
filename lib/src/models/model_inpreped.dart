// To parse this JSON data, do
//
//     final inprepedModel = inprepedModelFromJson(jsonString);

import 'dart:convert';

InprepedModel inprepedModelFromJson(String str) =>
    InprepedModel.fromJson(json.decode(str));

String inprepedModelToJson(InprepedModel data) => json.encode(data.toJson());

class InprepedModel {
  InprepedModel({
    this.folio,
    this.fecha,
    this.local,
    this.bodega,
    this.codigob,
    this.codmp,
    this.cantidad,
    this.coduni,
    this.codunir,
    this.factorv,
    this.lote,
    this.ubicacion,
    this.vence,
    this.motivo,
    this.observacion,
    this.cantGuia,
    this.numPed,
    this.costop,
    this.linPed,
    this.cantAnt,
    this.estado,
    this.estPrep,
    this.cantHst,
    this.status,
    this.cantPed,
    this.cantEsc,
    this.cantNv,
  });

  String folio;
  DateTime fecha;
  int local;
  String bodega;
  String codigob;
  String codmp;
  int cantidad;
  String coduni;
  String codunir;
  int factorv;
  String lote;
  String ubicacion;
  DateTime vence;
  String motivo;
  String observacion;
  int cantGuia;
  String numPed;
  int costop;
  int linPed;
  int cantAnt;
  String estado;
  String estPrep;
  int cantHst;
  String status;
  int cantPed;
  int cantEsc;
  int cantNv;

  factory InprepedModel.fromJson(Map<String, dynamic> json) => InprepedModel(
        folio: json["folio"],
        fecha: DateTime.parse(json["fecha"]),
        local: json["local"],
        bodega: json["bodega"],
        codigob: json["codigob"],
        codmp: json["codmp"],
        cantidad: json["cantidad"],
        coduni: json["coduni"],
        codunir: json["codunir"],
        factorv: json["factorv"],
        lote: json["lote"],
        ubicacion: json["ubicacion"],
        vence: DateTime.parse(json["vence"]),
        motivo: json["motivo"],
        observacion: json["observacion"],
        cantGuia: json["cantGuia"],
        numPed: json["numPed"],
        costop: json["costop"],
        linPed: json["linPed"],
        cantAnt: json["cantAnt"],
        estado: json["estado"],
        estPrep: json["estPrep"],
        cantHst: json["cantHst"],
        status: json["status"],
        cantPed: json["cantPed"],
        cantEsc: json["cantEsc"],
        cantNv: json["cantNv"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "fecha": fecha.toIso8601String(),
        "local": local,
        "bodega": bodega,
        "codigob": codigob,
        "codmp": codmp,
        "cantidad": cantidad,
        "coduni": coduni,
        "codunir": codunir,
        "factorv": factorv,
        "lote": lote,
        "ubicacion": ubicacion,
        "vence": vence.toIso8601String(),
        "motivo": motivo,
        "observacion": observacion,
        "cantGuia": cantGuia,
        "numPed": numPed,
        "costop": costop,
        "linPed": linPed,
        "cantAnt": cantAnt,
        "estado": estado,
        "estPrep": estPrep,
        "cantHst": cantHst,
        "status": status,
        "cantPed": cantPed,
        "cantEsc": cantEsc,
        "cantNv": cantNv,
      };
}
