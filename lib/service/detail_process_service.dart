import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:quanly_app/models/process_stage.dart';
import 'package:quanly_app/util/global_cache.dart';

import 'api.dart';


class DetailProcessService {
  String stages;

  DetailProcessService({this.stages});
  Future<ProcessStage> getDetatil() async {
    print('xsmax xxxxx${GlobalCache().getUser().idProject}');
    ProcessStage detailProject;
    var response = await http.get('$baseApi/api/v1/projectProgress/getAll/${GlobalCache().getUser().idProject}/$stages');
    if (response.statusCode == 200) {
      var data = convert.json.decode(response.body);
      detailProject = ProcessStage.fromJson(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return detailProject;
  }

}
