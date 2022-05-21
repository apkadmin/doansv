import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:quanly_app/models/student.dart';

import 'api.dart';

class StudentService {
  GetUser(String idUser, String accsessToken) async {
    String _url = '${baseApi}/api/student/${idUser}';

    var res = await http.get(Uri.parse(_url));
    // var res = await http.get(_url, headers: {"x-access-token": accsessToken});

    if (res.statusCode == 200) {
      final data = convert.jsonDecode(res.body);
      return data;
    } else {
      print('Request failed with status: ${res.statusCode}.');
      return "auth problem";
    }
  }
}
