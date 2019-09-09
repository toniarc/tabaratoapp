
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tabaratoapp/model/user.dart';
import 'package:tabaratoapp/resources/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loginTouch = false;
  bool _passwordTouch = false;

  bool _enabled = true;

  AuthenticationService _authApi = new AuthenticationService();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {

    var _onPressed = () {
      if (_formKey.currentState.validate()) {

        setState(() {
          _enabled = false;
        });

        Future<User> user = _authApi.login(_loginController.text, _passwordController.text);
        user.then((user) {
          if (user.hasToken()) {
            storage.write(key: 'token', value: user.token);
            Navigator.pushReplacementNamed(context, '/');
          } else {
            Navigator.pushReplacementNamed(context, '/login');
          }
        });

        user.catchError((value) {
          setState(() {
            _enabled = true;
          });
          
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(value.message),
              action: SnackBarAction(
                label: 'Fechar',
                onPressed: () {},
              ),
            )
          );
          
        });
      }
    };

    buildButtonEnabled() {
      return RaisedButton(
        onPressed: _onPressed,
        child: Text('Entrar'),
      );
    }

    validateLoginInput() {
      return _loginTouch && (_loginController.text == null || _loginController.text.trim().length == 0) ? 'Informe o login' : null;
    }

    validateSenhaInput() {
      return _passwordTouch && (_passwordController.text == null || _passwordController.text.trim().length == 0) ? 'Informe o login' : null;
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  enabled: _enabled,
                  errorText: validateLoginInput()
                ),
                controller: _loginController,
                onTap: () {
                  setState(() {
                    _loginTouch = true;
                  });
                }
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  enabled: _enabled,
                  errorText: validateSenhaInput()
                ),
                controller: _passwordController,
                obscureText: true,
                onTap: () {
                  setState(() {
                    _passwordTouch = true;
                  });
                }
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: _enabled ? buildButtonEnabled() : CircularProgressIndicator(),
              )
            ],
          ),
        )
      ) 
    );
  }
}
