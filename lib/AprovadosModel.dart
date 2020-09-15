import 'dart:convert';

Aprovados aprovadosFromJson(String str) => Aprovados.fromJson(json.decode(str));

String aprovadosToJson(Aprovados data) => json.encode(data.toJson());

class Aprovados {
  Aprovados({
    this.idlan,
    this.dataVencimento,
    this.historico,
    this.nome,
    this.valorOriginal
  });

  String idlan;
  String dataVencimento;
  String historico;
  String nome;
  double valorOriginal;

  factory Aprovados.fromJson(Map<String, dynamic> json) => Aprovados(
    idlan: json["IDLAN"],
    dataVencimento: json["dataVencimento"],
    historico: json["historico"],
    nome: json['nome'],
    valorOriginal: json['valorOriginal']
  );

  Map<String, dynamic> toJson() => {
    "IDLAN": idlan,
    "dataVencimento": dataVencimento,
    "historico": historico,
    "nome": nome,
    "valorOriginal": valorOriginal

  };
}
