import 'package:flutter/material.dart';
import 'package:tabaratoapp/model/produto.dart';
import 'package:tabaratoapp/resources/categoria_service.dart';

class CategoriaModel extends ChangeNotifier {

  CategoriaService service = new CategoriaService();

  List<Categoria> categorias = new List();

  carregarCategorias() async {
    
    service.buscar().then((items) {
      for (Categoria c in items) {
        categorias.add(c);
      }
      notifyListeners();
    });
    
  }

}