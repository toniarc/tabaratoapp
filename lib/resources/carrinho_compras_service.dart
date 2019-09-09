import 'dart:collection';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:tabaratoapp/exception/produto_nao_encontrado_exception.dart';
import 'package:tabaratoapp/model/produto.dart';

class CarrinhoComprasService {

  List<Produto> _produtos = [];

  Client client = new Client();

  final storage = new FlutterSecureStorage();

  String _baseUrl = 'https://tabarato-service.herokuapp.com/service';

  Future<Produto> buscar(Produto filtro) async {

    Map<String, String> _headers = new Map();
    _headers['Content-Type'] = 'application/json';

    String token = await storage.read(key: 'token');
    _headers['Authorization'] = 'Bearer ' + token;

    String url = '$_baseUrl/produto/barcode/' + filtro.barcode.toString();
    final response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {

      if(response.body != null && response.body.trim().length == 0){
        throw ProdutoNaoEncontradoException();
      }

      return Produto.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao pesquisar produto');
    }
  }

}