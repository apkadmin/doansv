import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/models/project.model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Row(
        children: [
          Container(
              width: 90.0,
              height: 135.0,
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
                  Text(
                    project.state ? "Sinh viên đăng ký" : "chưa đăng ký",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kDetailContent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
