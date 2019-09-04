import 'package:flutter/material.dart';
import 'package:tabaratoapp/resources/authentication_api_provider.dart';
import 'package:tabaratoapp/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  bool _enabled = true;

  AuthenticationAPIProvider authApi = new AuthenticationAPIProvider();

  @override
  Widget build(BuildContext context) {

    var _onPressed;
    if(_enabled){
      _onPressed = () {
        if (_formKey.currentState.validate()) {

          setState(() {
            _enabled = false;
          });

          Future<User> user = authApi.login(loginController.text, passwordController.text);
          user.then((user) => {
                if (user.hasToken())
                  {Navigator.pushReplacementNamed(context, '/')}
                else
                  {Navigator.pushReplacementNamed(context, '/login')}
              });

          user.catchError((value) => {
            setState(() {
              _enabled = true;
            }),
            print(value)
          });
        }
      };
    } else {
      _onPressed = null;
    }


    return Scaffold(
        body: 
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login'
                  ),
                  controller: loginController,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Informe o login';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha'
                  ),
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Informe a senha';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: FutureBuilder(
                    future: authApi.login(loginController.text, passwordController.text),
                    builder: (context, snapshot){
                      if (snapshot.data.hasToken()){
                        return HomePage();
                      } 

                      if(snapshot.error) {
                        return AlertDialog(
                          title: Text('Not in stock'),
                          content: const Text('This item is no longer available'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }

                      return LoginPage();
                    },
                  ),
                  child: Text('Entrar'),
                )
              ],
            ),
          )));
  }
}
