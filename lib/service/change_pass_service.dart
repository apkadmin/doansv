import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:quanly_app/util/global_cache.dart';

import 'api.dart';

class ChangePassService
{
   String _url = '${baseApi}/api/v1/user/changePass';
  changePass(
      {String oldPass,
      String newPass}) async {
    var res = await http.post(_url,
        headers: {}, body: {"id": GlobalCache().getUser().id, "oldPassword": oldPass,"newPassword":newPass});
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