import 'package:flutter/material.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/models/teacher.model.dart';
import 'package:quanly_app/pages/list/project_detail.dart';
import 'package:quanly_app/pages/list/teacher_info.dart';
import 'package:quanly_app/widgets/project_cart.dart';
import 'package:quanly_app/widgets/teacher_card.dart';

class SearchPageTeacher extends StatefulWidget {
  List<Teacher>  teacher;

  SearchPageTeacher({Key key, this.teacher}) : super(key: key);

  @override
  _SearchPageTeacherState createState() => _SearchPageTeacherState();
}

class _SearchPageTeacherState extends State<SearchPageTeacher> {
  List<Teacher> listTeacher ;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    listTeacher = widget.teacher;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    onChanged: (value){
                      setState(() {
                        listTeacher = widget.teacher
                            .where((element) => element.name
                            .toUpperCase()
                            .contains(value.toUpperCase()))
                            .toList();
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Expanded(
              child:   Container(
                  child: ListView.builder(
                      itemCount: listTeacher?.length ?? 0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        Teacher _teacher = listTeacher[index];
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
                      }))
            ),
          ],
        ),
      ),
    );
  }
}
