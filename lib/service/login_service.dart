import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'api.dart';

class AuthService {
  static String _url = '${baseApi}/api/auth/signin';
  Login(String username, String password) async {
    var res = await http.post(_url,
        headers: {}, body: {"username": username, "password": password});

    if (res.statusCode == 200) {
      final data = convert.jsonDecode(res.body);
      return data;
    } else {
      print('Request failed with status: ${res.statusCode}.');
      final data = convert.jsonDecode(res.body);
      return data;
    }
  }
}
