import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabaratoapp/resources/authentication_service.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenPageState();
  }

}

class _SplashScreenPageState extends State<SplashScreenPage> {

  AuthenticationService auth = new AuthenticationService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, 'login');      
    });

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

