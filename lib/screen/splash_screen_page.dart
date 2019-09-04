import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabaratoapp/resources/authentication_api_provider.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenPageState();
  }

}

class _SplashScreenPageState extends State<SplashScreenPage> {

  AuthenticationAPIProvider auth = new AuthenticationAPIProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, 'login');      
    });

    /*
    Future<User> user = auth.login('admin', '123456');
    user.then( (user) => {
      if(user.hasToken()){
        Navigator.pushReplacementNamed(context, '/')
      } else {
        Navigator.pushReplacementNamed(context, '/login')
      }
    });*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50),
        ),
        Center(
          child: Image.asset('images/resources_icon.png', width: 400),
        ),
        CircularProgressIndicator()
      ],),
      backgroundColor: Colors.black,
    );
  }

}

