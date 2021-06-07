import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/pages/list/bloc_list_project/list_project_bloc.dart';
import 'package:quanly_app/pages/list/list_project_tab_page.dart';
import 'package:quanly_app/pages/list/list_teacher_tab_page.dart';
import 'package:quanly_app/service/project_service.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Danh sách đồ án'),
    Tab(text: 'Danh sách giảng viên'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Danh sách", style: kActiveTabStyle),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Colors.black,
          ),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [BlocProvider(
             create: (_)=> ListProjectBloc(projectService: ProjectService()),
              child: ListProjectTabPage()), ListTeacherTabPage()],
        ),
      ),
    );
  }
}
