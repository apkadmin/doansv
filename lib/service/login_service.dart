import 'package:http/http.dart' as http;
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'dart:convert' as convert;
import 'api.dart';

class AuthService {
  static String _url = '${baseApi}/api/v1/auth/signin';
  Student student;
  Login(String username, String password) async {
    var res = await http.post(Uri.parse(_url),
        headers: {}, body: {"username": username, "password": password});

    if (res.statusCode == 200) {
      Map<String, dynamic> data = convert.jsonDecode(res.body);
      Student student = Student.fromJson(data);
      if (student != null) {
        GlobalCache().setUser(student);
      }

      return data;
    } else {
      final data = convert.jsonDecode(res.body);
      return data;
    }
  }
}
