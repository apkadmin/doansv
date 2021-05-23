import 'dart:async';

import 'package:quanly_app/models/teacher.model.dart';
import 'package:quanly_app/service/teacher_service.dart';

class TeacherBLoC {
  Stream<List<Teacher>> get teacherList async* {
    yield await TeacherService.browse();
  }

  final StreamController<int> _teacherCouter = StreamController<int>();

  Stream<int> get teacherCounter => _teacherCouter.stream;

  TeacherBLoC() {
    teacherList.listen((list) => _teacherCouter.add(list.length));
  }
}
