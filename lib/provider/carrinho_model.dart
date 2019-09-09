import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:tabaratoapp/model/produto.dart';
import 'package:tabaratoapp/resources/carrinho_compras_service.dart';

class CarrinhoComprasModel extends ChangeNotifier {

  List<Produto> _produtos = [];

  CarrinhoComprasService service = new CarrinhoComprasService();

  UnmodifiableListView<Produto> get produtos => UnmodifiableListView(_produtos);

  adicionarAoCarrinho(Produto produto){
    _produtos.add(produto);
    notifyListeners();
  }

  Future<Produto> buscar(Produto filtro) {
    return service.buscar(filtro);
  }
}