import 'dart:async';

import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/service/news_service.dart';

class NewsBLoC {
  Stream<List<News>> get newsList async* {
    yield await NewsService.browse();
  }

  final StreamController<int> _newsCouter = StreamController<int>();

  Stream<int> get newsCounter => _newsCouter.stream;

  NewsBLoC() {
    newsList.listen((list) => _newsCouter.add(list.length));
  }
}
