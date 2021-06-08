import 'package:flutter/material.dart';
import 'package:quanly_app/bloc/project_bloc.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/pages/home_page.dart';
import 'package:quanly_app/pages/list/bloc_list_project/list_project_bloc.dart';
import 'package:quanly_app/service/register_project_service.dart';
import 'package:quanly_app/util/dialog_over_time.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'package:quanly_app/widgets/showMessage.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  ListProjectBloc projectBLoC;

  ProjectCard({this.project,this.projectBLoC});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    String idStudent = widget.project.idStudent;
    String idProject = GlobalCache()
        .getUser()
        .idProject;
    print("idprojecst: ${idStudent == "" ? 'khoảng trắng' : idStudent}");
    print("id project: ${GlobalCache()
        .getUser()
        .idProject == "" ? "null ID" : idProject}");
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
                    widget.project.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Chuyên ngành: " + widget.project.majors,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kDetailContent,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "GVHD: " + widget.project.nameTeacher,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kDetailContent,
                  ),
                  SizedBox(height: 4.0),
                  Container(
                      height: 40,
                      child: idStudent == "" && idProject == "" ||
                          idStudent == null && idProject == null
                          || idStudent == null && idProject == "" ?
                      TextButton(
                          style:
                          TextButton.styleFrom(backgroundColor: Colors.red,
                              minimumSize: Size(double.infinity, 50)),
                          onPressed: () async {
                            setState(() {
                              idStudent = GlobalCache()
                                  .getUser()
                                  .idStudent;
                              idProject = widget.project.id;
                            });

                            String succes = await RegisterProjectService()
                                .registerProject(widget.project.id,
                                GlobalCache()
                                    .getUser()
                                    .idStudent, GlobalCache()
                                    .getUser()
                                    .nameStudent);
                            print(succes);
                            if (succes != null) {

                              Student student = GlobalCache().getUser();
                              student.idProject = widget.project.id;
                              GlobalCache().setUser(student);
                              showMessage(context, "Đăng ký đề tài thành công");
                              widget.projectBLoC.add(LoadListProjectEvent());
                            }
                          },
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )) : idProject != null && idProject!="" ? Text(
                          'Bạn đã có đề tài') : Text(
                          "Đề tài đã có người đăng ký")
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
