import 'dart:convert';

import 'package:tabaratoapp/exception/produto_nao_encontrado_exception.dart';
import 'package:tabaratoapp/model/produto.dart';
import 'package:tabaratoapp/resources/abstract_service.dart';

class CategoriaService extends AbstractService {

  Future<List<Categoria>> buscar({Categoria filtro}) async {

    Map<String, String> _headers = new Map();
    _headers['Content-Type'] = 'application/json';

    String token = await storage.read(key: 'token');
    _headers['Authorization'] = 'Bearer ' + token;

    String url = '$baseUrl/categoria';
    final response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {

      if(response.body != null && response.body.trim().length == 0){
        throw ProdutoNaoEncontradoException();
      }

      List<Categoria> categorias = [];
      List<dynamic> parsedJson = json.decode(response.body);
      for (int i = 0; i < parsedJson.length; i++) {
        Categoria c = Categoria.fromJson(parsedJson[i]);
        categorias.add(c);
      }
      return categorias;
    } else {
      throw Exception('Falha ao pesquisar categorias');
    }
  }

}