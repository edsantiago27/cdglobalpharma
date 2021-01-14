// To parse this JSON data, do
//
//     final preparacionModel = preparacionModelFromJson(jsonString);

import 'dart:convert';

PreparacionModel preparacionModelFromJson(String str) =>
    PreparacionModel.fromJson(json.decode(str));

String preparacionModelToJson(PreparacionModel data) =>
    json.encode(data.toJson());

class PreparacionModel {
  PreparacionModel({
    this.sddoco,
    this.sdaitm,
    this.sdvr01,
    this.sddsc2,
    this.sddsc1,
    this.ncaja,
    this.origen,
    this.lote,
    this.cantidad,
    this.npallet,
    this.tipoProd,
    this.tipoCaja,
    this.dimensiones,
    this.pesoCajaPicking,
    this.pesoCajaEtiquetado,
    this.pesoCajaRecpSellado,
    this.pesoCajaSellado,
    this.pesoCajaDespacho,
    this.usuarioRecpEtiq,
    this.fecharecetiq,
    this.horarecetiq,
    this.usuarioEtiq,
    this.fechaEtiq,
    this.horaEtiq,
    this.usuarioRecpSellado,
    this.fechaRecpSellado,
    this.horaRecpSellado,
    this.usuarioSellado,
    this.fechaSellado,
    this.horaSellado,
    this.usuariodespacho,
    this.fechaDespacho,
    this.horadespacho,
    this.status,
    this.obs,
    this.fechaupdate,
    this.id,
    this.usuarioEmbarque,
    this.fechaEmbarque,
    this.horaEmbarque,
    this.cantVali,
    this.ncaja1,
    this.sddoc,
    this.sdan8,
    this.skucliente,
  });

  String sddoco;
  String sdaitm;
  String sdvr01;
  String sddsc2;
  String sddsc1;
  String ncaja;
  dynamic origen;
  String lote;
  int cantidad;
  dynamic npallet;
  dynamic tipoProd;
  dynamic tipoCaja;
  dynamic dimensiones;
  dynamic pesoCajaPicking;
  dynamic pesoCajaEtiquetado;
  dynamic pesoCajaRecpSellado;
  dynamic pesoCajaSellado;
  dynamic pesoCajaDespacho;
  dynamic usuarioRecpEtiq;
  dynamic fecharecetiq;
  dynamic horarecetiq;
  dynamic usuarioEtiq;
  dynamic fechaEtiq;
  dynamic horaEtiq;
  dynamic usuarioRecpSellado;
  dynamic fechaRecpSellado;
  dynamic horaRecpSellado;
  dynamic usuarioSellado;
  dynamic fechaSellado;
  dynamic horaSellado;
  dynamic usuariodespacho;
  dynamic fechaDespacho;
  dynamic horadespacho;
  dynamic status;
  dynamic obs;
  dynamic fechaupdate;
  int id;
  dynamic usuarioEmbarque;
  dynamic fechaEmbarque;
  dynamic horaEmbarque;
  int cantVali;
  dynamic ncaja1;
  dynamic sddoc;
  dynamic sdan8;
  dynamic skucliente;

  factory PreparacionModel.fromJson(Map<String, dynamic> json) =>
      PreparacionModel(
        sddoco: json["sddoco"],
        sdaitm: json["sdaitm"],
        sdvr01: json["sdvr01"],
        sddsc2: json["sddsc2"],
        sddsc1: json["sddsc1"],
        ncaja: json["ncaja"],
        origen: json["origen"],
        lote: json["lote"],
        cantidad: json["cantidad"],
        npallet: json["npallet"],
        tipoProd: json["tipoProd"],
        tipoCaja: json["tipoCaja"],
        dimensiones: json["dimensiones"],
        pesoCajaPicking: json["pesoCajaPicking"],
        pesoCajaEtiquetado: json["pesoCajaEtiquetado"],
        pesoCajaRecpSellado: json["pesoCajaRecpSellado"],
        pesoCajaSellado: json["pesoCajaSellado"],
        pesoCajaDespacho: json["pesoCajaDespacho"],
        usuarioRecpEtiq: json["usuarioRecpEtiq"],
        fecharecetiq: json["fecharecetiq"],
        horarecetiq: json["horarecetiq"],
        usuarioEtiq: json["usuarioEtiq"],
        fechaEtiq: json["fechaEtiq"],
        horaEtiq: json["horaEtiq"],
        usuarioRecpSellado: json["usuarioRecpSellado"],
        fechaRecpSellado: json["fechaRecpSellado"],
        horaRecpSellado: json["horaRecpSellado"],
        usuarioSellado: json["usuarioSellado"],
        fechaSellado: json["fechaSellado"],
        horaSellado: json["horaSellado"],
        usuariodespacho: json["usuariodespacho"],
        fechaDespacho: json["fechaDespacho"],
        horadespacho: json["horadespacho"],
        status: json["status"],
        obs: json["obs"],
        fechaupdate: json["fechaupdate"],
        id: json["id"],
        usuarioEmbarque: json["usuarioEmbarque"],
        fechaEmbarque: json["fechaEmbarque"],
        horaEmbarque: json["horaEmbarque"],
        cantVali: json["cantVali"],
        ncaja1: json["ncaja1"],
        sddoc: json["sddoc"],
        sdan8: json["sdan8"],
        skucliente: json["skucliente"],
      );

  Map<String, dynamic> toJson() => {
        "sddoco": sddoco,
        "sdaitm": sdaitm,
        "sdvr01": sdvr01,
        "sddsc2": sddsc2,
        "sddsc1": sddsc1,
        "ncaja": ncaja,
        "origen": origen,
        "lote": lote,
        "cantidad": cantidad,
        "npallet": npallet,
        "tipoProd": tipoProd,
        "tipoCaja": tipoCaja,
        "dimensiones": dimensiones,
        "pesoCajaPicking": pesoCajaPicking,
        "pesoCajaEtiquetado": pesoCajaEtiquetado,
        "pesoCajaRecpSellado": pesoCajaRecpSellado,
        "pesoCajaSellado": pesoCajaSellado,
        "pesoCajaDespacho": pesoCajaDespacho,
        "usuarioRecpEtiq": usuarioRecpEtiq,
        "fecharecetiq": fecharecetiq,
        "horarecetiq": horarecetiq,
        "usuarioEtiq": usuarioEtiq,
        "fechaEtiq": fechaEtiq,
        "horaEtiq": horaEtiq,
        "usuarioRecpSellado": usuarioRecpSellado,
        "fechaRecpSellado": fechaRecpSellado,
        "horaRecpSellado": horaRecpSellado,
        "usuarioSellado": usuarioSellado,
        "fechaSellado": fechaSellado,
        "horaSellado": horaSellado,
        "usuariodespacho": usuariodespacho,
        "fechaDespacho": fechaDespacho,
        "horadespacho": horadespacho,
        "status": status,
        "obs": obs,
        "fechaupdate": fechaupdate,
        "id": id,
        "usuarioEmbarque": usuarioEmbarque,
        "fechaEmbarque": fechaEmbarque,
        "horaEmbarque": horaEmbarque,
        "cantVali": cantVali,
        "ncaja1": ncaja1,
        "sddoc": sddoc,
        "sdan8": sdan8,
        "skucliente": skucliente,
      };
}
