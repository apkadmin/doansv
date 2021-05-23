import 'package:flutter/material.dart';
import 'package:quanly_app/bloc/teacher_bloc.dart';
import 'package:quanly_app/models/teacher.model.dart';
import 'package:quanly_app/pages/list/teacher_info.dart';
import 'package:quanly_app/widgets/teacher_card.dart';

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
              return Container(
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
                      }));
          }
        });
  }
}
