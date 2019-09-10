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

    fabricante = Fabricante.fromJson(parsedJson['fabricante']);
    embalagem = Embalagem.fromJson(parsedJson['embalagem']);
    unidadeMedida = UnidadeMedida.fromJson(parsedJson['unidadeMedida']);
    categoria = Categoria.fromJson(parsedJson['categoria']);
  }

}

class Fabricante {
  int id;
  String nome;   

  Fabricante.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    nome = parsedJson['nome'];
  } 
}

class Embalagem {
  int id;
  String descricao;
  String sigla;

  Embalagem.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    descricao = parsedJson['descricao'];
    sigla = parsedJson['sigla'];
  }

}

class UnidadeMedida {
  int id;
  String descricao;
  String sigla;

  UnidadeMedida.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    descricao = parsedJson['descricao'];
    sigla = parsedJson['sigla'];
  }
}

class Categoria {
  int id;
  String descricao;

  Categoria();

  Categoria.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    descricao = parsedJson['descricao'];
  }
}