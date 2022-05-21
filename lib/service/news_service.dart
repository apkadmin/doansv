import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:quanly_app/models/news.dart';

import 'api.dart';

class NewsService {
  static String _url = '${baseApi}/api/v1/news/getAll';
  static Future browse() async {
    List collection;
    List<News> _news;
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _news = collection.map((json) => News.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _news;
  }
}
