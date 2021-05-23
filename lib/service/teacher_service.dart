import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:quanly_app/models/teacher.model.dart';

import 'api.dart';

class TeacherService {
  static String _url = '${baseApi}/api/v1/teacher/getAll';
  static Future browse() async {
    List collection;
    List<Teacher> _teacher;
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _teacher = collection.map((json) => Teacher.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _teacher;
  }
}
