import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tabaratoapp/provider/authentication_model.dart';
import 'package:tabaratoapp/screen/home_page.dart';
import 'package:tabaratoapp/screen/login_page.dart';
import 'package:tabaratoapp/screen/splash_screen_page.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) => {
      runApp(ChangeNotifierProvider(
        builder: (context) => AuthenticationModel(),
        child: TaBaratoApp(),
      ))
    });

}

class TaBaratoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SplashScreenPage(),
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => HomePage(title: 'Ta Barato?'),
        'splash_screen': (context) =>  SplashScreenPage(),
        'login': (context) => LoginPage()
      },
    );
  }
}

