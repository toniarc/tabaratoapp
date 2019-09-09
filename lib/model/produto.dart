class Produto {
  int id;
  String barcode;
  String descricao;
  double quantidade;
  bool ativo;
  Fabricante fabricante;
  Embalagem embalagem;
  UnidadeMedida unidadeMedida;
  Categoria categoria;

  Produto(String barcode){
    this.barcode = barcode;
  }

  Produto.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    barcode = parsedJson['barcode'];
    descricao = parsedJson['descricao'];
    quantidade = parsedJson['quantidade'];
    ativo = parsedJson['ativo'];

    fabricante = parsedJson['fabricante'];
    embalagem = parsedJson['embalagem'];
    unidadeMedida = parsedJson['unidadeMedida'];
    categoria = parsedJson['categoria'];
  }

}

class Fabricante {
  int id;
  String nome;    
}

class Embalagem {
  int id;
  String descricao;
  String sigla;
}

class UnidadeMedida {
  int id;
  String descricao;
  String sigla;
}

class Categoria {
  int id;
  String descricao;
}