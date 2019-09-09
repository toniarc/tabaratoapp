import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tabaratoapp/exception/produto_nao_encontrado_exception.dart';
import 'package:tabaratoapp/model/produto.dart';
import 'package:tabaratoapp/provider/carrinho_model.dart';
import 'package:tabaratoapp/screen/app_bar.dart';
import 'package:tabaratoapp/screen/produto_form_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String result = "";

  Future<String> _scanBarcode() async {
    try {
      return await BarcodeScanner.scan();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Sem premissão para usar a câmera";
        });
      } else {
        setState(() {
          result = "Ocorreu um erro $e";
        });
      }
    } on FormatException catch (e) {
      setState(() {
        result = "Você cancelou o scanner";
      });
    } catch (e) {
      setState(() {
        result = "Ocorreu um erro $e";
      });
    }

    return null;
  }

  displayDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Este produto ainda não foi cadastrado'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { 
                Navigator.pushNamed(context, 'produto_form');
              },
              child: const Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () { 
                Navigator.pushNamed(context, 'produto_form');
              },
              child: const Text('State department'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    CarrinhoComprasModel carrinhoModel = Provider.of<CarrinhoComprasModel>(context);
    
    return Scaffold(
      appBar: AppBarDefault(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scanBarcode().then((barcode) {
            Produto filtro = new Produto(barcode);
            carrinhoModel.buscar(filtro).then((produto) {
              print(produto);
            }).catchError((error){
              if(error is ProdutoNaoEncontradoException){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutoFormPage()));
              }
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ), 
    );
  }
}