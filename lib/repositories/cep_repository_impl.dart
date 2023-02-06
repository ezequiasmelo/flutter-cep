import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_cep/models/endereco_model.dart';

import './cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<EnderecoModel> getCep(String cep) async {
    try {
      final result = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      if (jsonDecode(jsonEncode(result.data))['erro'] != null) {
        log('Erro ao buscar CEP');
        throw Exception('Erro ao buscar CEP');
      }
      return EnderecoModel.fromMap(result.data);
    } on DioError catch (e) {
      log('Erro ao buscar CEP', error: e);
      throw Exception('Erro ao buscar CEP');
    }
  }
}
