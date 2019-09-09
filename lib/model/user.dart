class User {
  String _token;
  String _username;
  List<String> _roles;

  User.fromJson(Map<String, dynamic> parsedJson) {
    _token = parsedJson['token'];
    _username = parsedJson['username'];
    _roles = [];
    for (int i = 0; i < parsedJson['roles'].length; i++) {
      String result = parsedJson['roles'][i];
      _roles.add(result);
    }
  }

  hasToken() {
    if (_token != null && _token.length > 0) {
      return true;
    }
    return false;
  }

  get token => _token;
}