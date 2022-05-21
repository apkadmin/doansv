import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/bloc/student__user_bloc.dart';
import 'package:quanly_app/events/user_events.dart';
import 'package:quanly_app/models/detail_project.dart';
import 'package:quanly_app/pages/list/list_page.dart';
import 'package:quanly_app/pages/news/news_page.dart';
import 'package:quanly_app/pages/profile_student_page.dart';
import 'package:quanly_app/pages/project_page/detail_project_bloc.dart';
import 'package:quanly_app/pages/project_page/project_page.dart';
import 'package:quanly_app/service/detail_project_service.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() =>HomePageState();
}

class HomePageState extends State<HomePage> {
  StudentBloC studentBloc;
  String id;
  String token;

  void getUser() async {
    var pref = await SharedPreferences.getInstance();
    id = pref.getString('id');
    token = pref.getString('accessToken');
    print("id :" + id);
    print("token :" + token);
    // studentBloc.add(GetUserEvent(idUser: id, tokenAuthen: token));
  }

  @override
  void initState() {
    // studentBloc = BlocProvider.of<StudentBloC>(context);
    super.initState();
    getUser();
  }

  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    NewPage(),
    ListPage(),
    GlobalCache().getUser().idProject == null
        ? Center(
            child: Text('Bạn Chưa đăng ký project'),
          )
        : BlocProvider(
      create: (_)=>DetailProjectBloc(detaiProjectService: DetaiProjectService()),
        child: ProjectPage()),
    ProfileStudentPage()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void hometab()
  {
    setState(() {
      _selectedIndex =0;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              label: "Tin tức",),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              label: "Danh sách",
                ),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              label: "Tiến độ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
             label:"cá nhân",
                 ),
        ],
      ),
    );
  }
}
