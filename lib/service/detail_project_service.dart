import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:quanly_app/models/detail_project.dart';
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/util/global_cache.dart';

import 'api.dart';

class DetaiProjectService {
    String _url =
      '${baseApi}/api/v1/project/getId/${GlobalCache().getUser().idProject}';

  Future<DetailProject> getDetatil() async {
    DetailProject detailProject;
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var data = convert.json.decode(response.body);
      detailProject = DetailProject.fromJson(data);
      // detailProject = new DetailProject(
      //   workspaceTeacher: data['workspaceTeacher'].toString(),
      //   phoneStudent: data['phoneStudent'].toString(),
      //   nameTeacher: data['nameTeacher'].toString(),
      //   nameStudent: data['nameStudent'].toString(),
      //   emailStudent: data['emailStudent'].toString(),
      //   majors: data['majors'].toString(),
      //   emailTeacher: data['emailTeacher'].toString(),
      //   name: data['name'].toString(),
      //   phoneTeacher: data['phoneTeacher'].toString(),
      //   projectContent: data['projectContent'].toString(),
      //   projectRequest: data['projectRequestl'].toString(),
      // );
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return detailProject;
  }
}
