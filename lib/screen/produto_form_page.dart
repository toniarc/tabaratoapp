import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabaratoapp/model/produto.dart';
import 'package:tabaratoapp/provider/categoria_model.dart';
import 'package:tabaratoapp/resources/categoria_service.dart';
import 'package:tabaratoapp/screen/app_bar.dart';

class ProdutoFormPage extends StatefulWidget {
  
  @override
  _ProdutoFormPageState createState() => _ProdutoFormPageState();

}

class _ProdutoFormPageState extends State<ProdutoFormPage> {
  bool _enabled = true;

  final _descricaoController = TextEditingController();
  final _codigoController = TextEditingController();
  Categoria _categoriaController;

  CategoriaService categoriaService = new CategoriaService();

  List<DropdownMenuItem<Categoria>> _items = [];

  buildButtonEnabled() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Adicionar ao Carrinho'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    categoriaService.buscar().then((onValue){
      setState(() {
        _items = onValue.map((item) {
          return new DropdownMenuItem<Categoria>(value: item, child: Text(item.descricao),);
        })?.toList();
        
      });
    });

    
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Produtos'),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Text('O produto selecionado ainda não está cadastrado. Favor preencha os dados abaixo.'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Código',
              enabled: _enabled
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if(value.isEmpty) {
                return 'Informe o código';
              } 
              return null;
            },
            controller: _codigoController,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Descrição',
              enabled: _enabled
            ),
            validator: (value) {
              if(value.isEmpty) {
                return 'Informe a descrição';
              } 
              return null;
            },
            controller: _descricaoController,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: new DropdownButton(
              value: _categoriaController,
              items: _items,
              onChanged: (value) {
                setState(() {
                  _categoriaController = value;
                });
              },
              isExpanded: true,
              hint: Text('Categoria'),
            ),
          )
            
        ],),
      )
      
    );
  }

}