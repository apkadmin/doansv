import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanly_app/pages/authen/login_page.dart';
import 'package:quanly_app/pages/change_pass_word.dart';
import 'package:quanly_app/util/global_cache.dart';

import '../constants.dart';

class ProfileStudentPage extends StatefulWidget {
  @override
  _ProfileStudentPageState createState() => _ProfileStudentPageState();
}

class _ProfileStudentPageState extends State<ProfileStudentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nameStudent = GlobalCache().getUser().nameStudent;
    String codeStudent = GlobalCache().getUser().code;
    String gmailStudent = GlobalCache().getUser().email;
    String adressStudent = GlobalCache().getUser().address;

    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Thông tin cá nhân",
          style: kActiveTabStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/IMG_2242.JPG"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.blue),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  nameStudent,
                  style: kCategoryTitle.copyWith(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "CT010328",
                  style: kCategoryTitle.copyWith(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0349715896",
                      style: kTitleCard,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "quangminhkma2809@gmail.com",
                      style: kTitleCard,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.school),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "CT1C - Di động",
                      style: kTitleCard,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.home_filled),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tân Triều,Thanh trì, Hà Nội",
                      style: kTitleCard,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  GlobalCache().setUser(null);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>ChangePassWord() ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.login_rounded
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Đổi mật khẩu",
                        style: kTitleCard,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  GlobalCache().setUser(null);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.login_rounded
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Đăng xuất",
                        style: kTitleCard,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
