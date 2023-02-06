import 'dart:convert';

class EnderecoModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String complemento;

  EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.complemento,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'complemento': complemento,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      complemento: map['complemento'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
