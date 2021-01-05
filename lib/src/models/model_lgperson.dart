import 'dart:convert';

LgpersonModel usersModelFromJson(String str) =>
    LgpersonModel.fromJson(json.decode(str));

String usersModelToJson(LgpersonModel data) => json.encode(data.toJson());

class LgpersonModel {
  LgpersonModel({
    this.codPer,
    this.desPer,
    this.prep,
    this.rev,
    this.trans,
    this.usuario,
  });

  String codPer;
  String desPer;
  String prep;
  String rev;
  String trans;
  String usuario;

  factory LgpersonModel.fromJson(Map<String, dynamic> json) => LgpersonModel(
        codPer: json["codPer"],
        desPer: json["desPer"],
        prep: json["prep"],
        rev: json["rev"],
        trans: json["trans"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "codPer": codPer,
        "desPer": desPer,
        "prep": prep,
        "rev": rev,
        "trans": trans,
        "usuario": usuario,
      };
}
