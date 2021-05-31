import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/service/register_project_service.dart';
import 'package:quanly_app/util/dialog_over_time.dart';
import 'package:quanly_app/util/global_cache.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Row(
        children: [
          Container(
              width: 90.0,
              height: 175.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://raw.githubusercontent.com/gist/vinhjaxt/fa4208fd6902dd8b2f4d944fa6e7f2af/raw/454f58aeac4fdeb459476eae7128dc6ff57df25f/logo-hvktmm.png"),
                      fit: BoxFit.cover))),
          SizedBox(width: 4.0),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Chuyên ngành: " + project.majors,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kDetailContent,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "GVHD: " + project.nameTeacher,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kDetailContent,
                  ),
                  SizedBox(height: 4.0),
                  Container(
                     height: 40,
                      child: project.idStudent==null && GlobalCache().getUser().idProject==null?
                      TextButton(
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red,
                              minimumSize: Size(double.infinity,50)),
                          onPressed: () async {
                            CircularProgressIndicator();
                            String succes = await  RegisterProjectService().registerProject(project.id, GlobalCache().getUser().idStudent, GlobalCache().getUser().nameStudent);
                            if(succes =="đăng ký thành công")
                              {
                                Navigator.pop(context);
                                DiaLogOverTime('Đăng ký Project',(){Navigator.pop(context);});
                              }
                          },
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )):Text('Đề tài đã có người đăng ký')
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
