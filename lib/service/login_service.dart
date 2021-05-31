import 'package:http/http.dart' as http;
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'dart:convert' as convert;
import 'api.dart';

class AuthService {
  static String _url = '${baseApi}/api/auth/signin';
  Student student;
  Login(String username, String password) async {
    var res = await http.post(_url,
        headers: {}, body: {"username": username, "password": password});

    if (res.statusCode == 200) {

     Map<String,dynamic> data = convert.jsonDecode(res.body);
     Student student = Student(id: data['id'],accessToken: data['accessToken'],idProject: data['idProject'],nameStudent: data['nameStudent'],idStudent: data['idStudent']);
     print("sssssssdfsdsdgdasgsdr${student.idProject.toString()}");
      if(student!=null)
        {
          GlobalCache().setUser(student);
        }

      return data;
    } else {
      print('Request failed with status: ${res.statusCode}.');
      final data = convert.jsonDecode(res.body);
      return data;
    }
  }
}
