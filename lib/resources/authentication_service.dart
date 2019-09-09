import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:tabaratoapp/model/user.dart';

class AuthenticationService {
  Client client = Client();

  String _baseUrl = 'https://tabarato-service.herokuapp.com/service';

  Future<User> login(String username, String password) async {
    Map<String, String> _headers = new Map();
    _headers['Content-Type'] = 'application/json';

    String credentials = '{"username": "$username","password": "$password"}';
    String url = '$_baseUrl/generate-token';
    final response =
        await client.post(url, body: credentials, headers: _headers);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return User.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Falha no login');
    }
  }
}


