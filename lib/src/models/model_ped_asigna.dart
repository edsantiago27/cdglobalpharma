import 'dart:convert';

PedidosAsignadosModel pedidosAsignadosModelFromJson(String str) =>
    PedidosAsignadosModel.fromJson(json.decode(str));

String pedidosAsignadosModelToJson(PedidosAsignadosModel data) =>
    json.encode(data.toJson());

class PedidosAsignadosModel {
 
  PedidosAsignadosModel({
    this.folio,
    this.total,
    this.lineas,
    this.status,
    this.codPer,
    this.numPed,
    this.area,
    this.fecha,
    this.desPer,
    this.bodega,
    //this.fasign,
  });

  String folio;
  int total;
  int lineas;
  String status;
  String codPer;
  String numPed;
  String area;
  DateTime fecha;
  String desPer;
  String bodega;
  //dynamic fasign;

  factory PedidosAsignadosModel.fromJson(Map<String, dynamic> json) =>
      PedidosAsignadosModel(
        folio: json["folio"],
        total: json["total"],
        lineas: json["líneas"],
        status: json["status"],
        codPer: json["codPer"],
        numPed: json["numPed"],
        area: json["area"],
        fecha: DateTime.parse(json["fecha"]),
        desPer: json["desPer"],
        bodega: json["bodega"],
        //fasign: json["fasign"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "total": total,
        "líneas": lineas,
        "status": status,
        "codPer": codPer,
        "numPed": numPed,
        "area": area,
        "fecha": fecha.toIso8601String(),
        "desPer": desPer,
        "bodega": bodega,
        //"fasign": fasign,
      };
}
