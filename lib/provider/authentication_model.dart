import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tabaratoapp/model/user.dart';
import 'package:tabaratoapp/resources/authentication_service.dart';

class AuthenticationModel extends ChangeNotifier {

  AuthenticationService _authApi = new AuthenticationService();

  final storage = new FlutterSecureStorage();

  bool _loggedin = false;

  bool loading = false;

  loggedin(String login, String senha) {
    
    loading = true;
    notifyListeners();

    Future<User> user = _authApi.login(login, senha);
    user.then((user) {
      if (user.hasToken()) {
        storage.write(key: 'token', value: user.token);
      } else {
        
      }
    });

    notifyListeners();
  }


}
