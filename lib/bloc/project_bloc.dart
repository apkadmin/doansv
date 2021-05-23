import 'dart:async';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/service/project_service.dart';

class ProjectBLoC {
  Stream<List<Project>> get projectList async* {
    yield await ProjectService.browse();
  }

  final StreamController<int> _projectCouter = StreamController<int>();

  Stream<int> get projectCounter => _projectCouter.stream;

  ProjectBLoC() {
    projectList.listen((list) => _projectCouter.add(list.length));
  }
}
