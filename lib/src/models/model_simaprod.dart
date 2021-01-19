// To parse this JSON data, do
//
//     final modelsSimaprod = modelsSimaprodFromJson(jsonString);

import 'dart:convert';

ModelsSimaprod modelsSimaprodFromJson(String str) => ModelsSimaprod.fromJson(json.decode(str));

String modelsSimaprodToJson(ModelsSimaprod data) => json.encode(data.toJson());

class ModelsSimaprod {
    ModelsSimaprod({
        this.codigoMat,
        this.descriMat,
        this.descriCom,
        this.descriRes,
        this.estado,
        this.fechaD,
        this.fechaC,
        this.unimedMat,
        this.clase,
        this.subclase,
        this.codbarra,
        this.clasificacion,
        this.forfar,
        this.practivo,
        this.controlado,
        this.precioVen,
        this.precioVenAnt,
        this.costoProm,
        this.costopAnt,
        this.costoUc,
        this.fechaUc,
        this.ordenUc,
        this.costoUc1,
        this.fechaUc1,
        this.ordenUc1,
        this.desValor,
        this.desPorc,
        this.incValor,
        this.incPorc,
        this.ventap,
        this.stkminMat,
        this.stkrepMat,
        this.stkmaxMat,
        this.tiempor,
        this.lotec,
        this.indice,
        this.revisar,
        this.precioRef,
        this.umCom,
        this.umProd,
        this.labo,
        this.idProv,
        this.prPortal,
        this.peso,
        this.cons1,
        this.cons2,
        this.cons3,
        this.cons4,
        this.cons5,
        this.cons6,
        this.pendRec,
        this.prOferta,
        this.feOferta,
        this.contiene,
        this.refrigerado,
        this.empaque,
        this.supervisado,
        this.cdgProv,
        this.clasif,
        this.registroIsp,
        this.codTcom,
        this.prActivo1,
        this.clTerap,
        this.codFran,
        this.bodPrim,
        this.volumenP,
        this.farma,
        this.petMinimo,
        this.tipoV,
    });

    String codigoMat;
    String descriMat;
    String descriCom;
    String descriRes;
    String estado;
    dynamic fechaD;
    DateTime fechaC;
    String unimedMat;
    String clase;
    String subclase;
    String codbarra;
    String clasificacion;
    String forfar;
    String practivo;
    String controlado;
    int precioVen;
    int precioVenAnt;
    int costoProm;
    int costopAnt;
    int costoUc;
    DateTime fechaUc;
    String ordenUc;
    int costoUc1;
    DateTime fechaUc1;
    String ordenUc1;
    int desValor;
    int desPorc;
    int incValor;
    int incPorc;
    int ventap;
    int stkminMat;
    int stkrepMat;
    int stkmaxMat;
    int tiempor;
    int lotec;
    String indice;
    String revisar;
    int precioRef;
    String umCom;
    String umProd;
    String labo;
    int idProv;
    int prPortal;
    int peso;
    int cons1;
    int cons2;
    int cons3;
    int cons4;
    int cons5;
    int cons6;
    int pendRec;
    int prOferta;
    dynamic feOferta;
    int contiene;
    String refrigerado;
    int empaque;
    String supervisado;
    String cdgProv;
    String clasif;
    dynamic registroIsp;
    String codTcom;
    String prActivo1;
    String clTerap;
    dynamic codFran;
    String bodPrim;
    int volumenP;
    String farma;
    String petMinimo;
    String tipoV;

    factory ModelsSimaprod.fromJson(Map<String, dynamic> json) => ModelsSimaprod(
        codigoMat: json["codigoMat"],
        descriMat: json["descriMat"],
        descriCom: json["descriCom"],
        descriRes: json["descriRes"],
        estado: json["estado"],
        fechaD: json["fechaD"],
        fechaC: DateTime.parse(json["fechaC"]),
        unimedMat: json["unimedMat"],
        clase: json["clase"],
        subclase: json["subclase"],
        codbarra: json["codbarra"],
        clasificacion: json["clasificacion"],
        forfar: json["forfar"],
        practivo: json["practivo"],
        controlado: json["controlado"],
        precioVen: json["precioVen"],
        precioVenAnt: json["precioVenAnt"],
        costoProm: json["costoProm"],
        costopAnt: json["costopAnt"],
        costoUc: json["costoUc"],
        fechaUc: DateTime.parse(json["fechaUc"]),
        ordenUc: json["ordenUc"],
        costoUc1: json["costoUc1"],
        fechaUc1: DateTime.parse(json["fechaUc1"]),
        ordenUc1: json["ordenUc1"],
        desValor: json["desValor"],
        desPorc: json["desPorc"],
        incValor: json["incValor"],
        incPorc: json["incPorc"],
        ventap: json["ventap"],
        stkminMat: json["stkminMat"],
        stkrepMat: json["stkrepMat"],
        stkmaxMat: json["stkmaxMat"],
        tiempor: json["tiempor"],
        lotec: json["lotec"],
        indice: json["indice"],
        revisar: json["revisar"],
        precioRef: json["precioRef"],
        umCom: json["umCom"],
        umProd: json["umProd"],
        labo: json["labo"],
        idProv: json["idProv"],
        prPortal: json["prPortal"],
        peso: json["peso"],
        cons1: json["cons1"],
        cons2: json["cons2"],
        cons3: json["cons3"],
        cons4: json["cons4"],
        cons5: json["cons5"],
        cons6: json["cons6"],
        pendRec: json["pendRec"],
        prOferta: json["prOferta"],
        feOferta: json["feOferta"],
        contiene: json["contiene"],
        refrigerado: json["refrigerado"],
        empaque: json["empaque"],
        supervisado: json["supervisado"],
        cdgProv: json["cdgProv"],
        clasif: json["clasif"],
        registroIsp: json["registroIsp"],
        codTcom: json["codTcom"],
        prActivo1: json["prActivo1"],
        clTerap: json["clTerap"],
        codFran: json["codFran"],
        bodPrim: json["bodPrim"],
        volumenP: json["volumenP"],
        farma: json["farma"],
        petMinimo: json["petMinimo"],
        tipoV: json["tipoV"],
    );

    Map<String, dynamic> toJson() => {
        "codigoMat": codigoMat,
        "descriMat": descriMat,
        "descriCom": descriCom,
        "descriRes": descriRes,
        "estado": estado,
        "fechaD": fechaD,
        "fechaC": fechaC.toIso8601String(),
        "unimedMat": unimedMat,
        "clase": clase,
        "subclase": subclase,
        "codbarra": codbarra,
        "clasificacion": clasificacion,
        "forfar": forfar,
        "practivo": practivo,
        "controlado": controlado,
        "precioVen": precioVen,
        "precioVenAnt": precioVenAnt,
        "costoProm": costoProm,
        "costopAnt": costopAnt,
        "costoUc": costoUc,
        "fechaUc": fechaUc.toIso8601String(),
        "ordenUc": ordenUc,
        "costoUc1": costoUc1,
        "fechaUc1": fechaUc1.toIso8601String(),
        "ordenUc1": ordenUc1,
        "desValor": desValor,
        "desPorc": desPorc,
        "incValor": incValor,
        "incPorc": incPorc,
        "ventap": ventap,
        "stkminMat": stkminMat,
        "stkrepMat": stkrepMat,
        "stkmaxMat": stkmaxMat,
        "tiempor": tiempor,
        "lotec": lotec,
        "indice": indice,
        "revisar": revisar,
        "precioRef": precioRef,
        "umCom": umCom,
        "umProd": umProd,
        "labo": labo,
        "idProv": idProv,
        "prPortal": prPortal,
        "peso": peso,
        "cons1": cons1,
        "cons2": cons2,
        "cons3": cons3,
        "cons4": cons4,
        "cons5": cons5,
        "cons6": cons6,
        "pendRec": pendRec,
        "prOferta": prOferta,
        "feOferta": feOferta,
        "contiene": contiene,
        "refrigerado": refrigerado,
        "empaque": empaque,
        "supervisado": supervisado,
        "cdgProv": cdgProv,
        "clasif": clasif,
        "registroIsp": registroIsp,
        "codTcom": codTcom,
        "prActivo1": prActivo1,
        "clTerap": clTerap,
        "codFran": codFran,
        "bodPrim": bodPrim,
        "volumenP": volumenP,
        "farma": farma,
        "petMinimo": petMinimo,
        "tipoV": tipoV,
    };
}
