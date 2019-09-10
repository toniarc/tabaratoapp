import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AbstractService {

  Client client = new Client();

  final storage = new FlutterSecureStorage();

  String baseUrl = 'https://tabarato-service.herokuapp.com/service';

}