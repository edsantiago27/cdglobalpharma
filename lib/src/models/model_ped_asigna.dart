import 'dart:convert';

PedidosAsignadosModel pedidosAsignadosFromJson(String str) =>
    PedidosAsignadosModel.fromJson(json.decode(str));

String pedidosAsignadosToJson(PedidosAsignadosModel data) =>
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
    this.fAsign,
  });

  String folio;
  String total;
  String lineas;
  String status;
  String codPer;
  String numPed;
  String area;
  String fecha;
  String desPer;
  String bodega;
  String fAsign;

  factory PedidosAsignadosModel.fromJson(Map<String, dynamic> json) =>
      PedidosAsignadosModel(
        folio: json["FOLIO"],
        total: json["Total"],
        lineas: json["Lineas"],
        status: json["Status"],
        codPer: json["Cod_Per"],
        numPed: json["NumPed"],
        area: json["Area"],
        fecha: json["Fecha"],
        desPer: json["Des_Per"],
        bodega: json["BODEGA"],
        fAsign: json["FAsign"],
      );

  Map<String, dynamic> toJson() => {
        "FOLIO": folio,
        "Total": total,
        "Lineas": lineas,
        "Status": status,
        "Cod_Per": codPer,
        "NumPed": numPed,
        "Area": area,
        "Fecha": fecha,
        "Des_Per": desPer,
        "BODEGA": bodega,
        "FAsign": fAsign,
      };
}
