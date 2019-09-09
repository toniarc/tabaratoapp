import 'package:flutter/material.dart';
import 'package:tabaratoapp/screen/app_bar.dart';

class ProdutoFormPage extends StatefulWidget {
  
  @override
  _ProdutoFormPageState createState() => _ProdutoFormPageState();

}

class _ProdutoFormPageState extends State<ProdutoFormPage> {
  bool _enabled = true;

  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  buildButtonEnabled() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Adicionar ao Carrinho'),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Text('O produto selecionado ainda não está cadastrado. Favor preencha os dados abaixo.'),
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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Preço',
              enabled: _enabled
            ),
            validator: (value) {
              if(value.isEmpty) {
                return 'Informe o preço';
              } 
              return null;
            },
            controller: _precoController,
          )
        ],),
      )
      
    );
  }

}