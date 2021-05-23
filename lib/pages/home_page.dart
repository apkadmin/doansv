import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/bloc/student__user_bloc.dart';
import 'package:quanly_app/events/user_events.dart';
import 'package:quanly_app/pages/list/list_page.dart';
import 'package:quanly_app/pages/news/news_page.dart';
import 'package:quanly_app/pages/profile_student_page.dart';
import 'package:quanly_app/pages/project_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    ProjectPage(),
    ProfileStudentPage()
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
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
              title: Text("Tin tức",
                  style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              title: Text("Danh sách",
                  style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              title: Text("Tiến độ",
                  style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              title: Text("cá nhân",
                  style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : Colors.grey))),
        ],
      ),
    );
  }
}
