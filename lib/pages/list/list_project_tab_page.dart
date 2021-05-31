import 'package:flutter/material.dart';
import 'package:quanly_app/bloc/project_bloc.dart';
import 'package:quanly_app/constants.dart';

// import 'package:quanly_app/models/project.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/pages/list/project_detail.dart';
import 'package:quanly_app/pages/list/search_page.dart';
import 'package:quanly_app/widgets/project_cart.dart';

class ListProjectTabPage extends StatelessWidget {
  ProjectBLoC projectBLoC = new ProjectBLoC();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: projectBLoC.projectList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("Có lỗi xảy ra: ${snapshot.error}");
              List<Project> project = snapshot.data;
              return Column(children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SearchPage(project: project,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black38,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4, right: 4,top: 4,bottom: 4),
                          width: 1,
                          color: Colors.black12,
                          height: 40,
                        ),
                        Expanded(
                            child: Text(
                          "search?",
                          style: kTitleCard.copyWith(color: Colors.black12,fontSize: 14,fontWeight: FontWeight.w100),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: project?.length ?? 0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        Project _project = project[index];
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProjectDetail(
                                            project: _project,
                                          )));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 160.0,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8.0),
                              child: ProjectCard(project: _project),
                            ));
                      },
                      // separatorBuilder: (context, index) => Divider(),
                    ),
                  ),
                ),
              ]);
          }
        });
  }
}
