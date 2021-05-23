import 'package:flutter/material.dart';
import 'package:quanly_app/bloc/teacher_bloc.dart';
import 'package:quanly_app/models/teacher.model.dart';
import 'package:quanly_app/pages/list/search_page.dart';
import 'package:quanly_app/pages/list/search_page_teacher.dart';
import 'package:quanly_app/pages/list/teacher_info.dart';
import 'package:quanly_app/widgets/teacher_card.dart';

import '../../constants.dart';

class ListTeacherTabPage extends StatefulWidget {
  ListTeacherTabPage({Key key}) : super(key: key);

  @override
  _ListTeacherTabPageState createState() => _ListTeacherTabPageState();
}

class _ListTeacherTabPageState extends State<ListTeacherTabPage> {
  TeacherBLoC teacherBLoC = new TeacherBLoC();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: teacherBLoC.teacherList,
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
              List<Teacher> teacher = snapshot.data;
              return Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPageTeacher(
                                 teacher: teacher,
                                )));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black38,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 4, right: 4, top: 4, bottom: 4),
                          width: 1,
                          color: Colors.black12,
                          height: 40,
                        ),
                        Expanded(
                            child: Text(
                          "search?",
                          style: kTitleCard.copyWith(
                              color: Colors.black12,
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      child: ListView.builder(
                          itemCount: teacher?.length ?? 0,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            Teacher _teacher = teacher[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TeacherInfo(
                                                teacher: _teacher,
                                              )));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 110.0,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 8.0),
                                  child: TeacherCard(teacher: _teacher),
                                ));
                          })),
                )
              ]);
          }
        });
  }
}
