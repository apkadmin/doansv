
import 'package:http/http.dart' as http;
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'dart:convert' as convert;
import 'api.dart';


class RegisterProjectService
{static String _url = '${baseApi}/api/v1/student/regis';
registerProject(String idProject, String idStudent,String nameStudent) async {
  var res = await http.post(_url,
      headers: {}, body: {"idProject": idProject, "idStudent": idStudent,"nameStudent":nameStudent});

  if (res.statusCode == 200) {
    Map<String,dynamic> data = convert.jsonDecode(res.body);
    String success = data['message'];

    return success;
  } else {
    print('Request failed with status: ${res.statusCode}.');
    final data = convert.jsonDecode(res.body);
    return data;
  }
}
}
