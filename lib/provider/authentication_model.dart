import 'package:flutter/material.dart';

class AuthenticationModel extends ChangeNotifier {

  bool _loggedin = false;

  loggedin() {
    _loggedin = true;
    notifyListeners();
    return _loggedin;
  }
}
