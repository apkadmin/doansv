import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/bloc/auth_bloc.dart';
import 'package:quanly_app/events/auth_events.dart';
import 'package:quanly_app/events/auth_state.dart';
import 'package:quanly_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  AuthBloC authBloC;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void initState() {
    authBloC = BlocProvider.of<AuthBloC>(context);
    super.initState();
  }

  var _uerNameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 ký tự";

  bool _userInvalid = false;
  bool _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
      child: Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffd8d8d8),
        ),
        child: FlutterLogo(),
      ),
    );

    final title = Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Text(
        "Ứng dụng đăng ký và \nquản lý đồ án",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    );

    final username = Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: TextField(
        style: TextStyle(fontSize: 18, color: Colors.black),
        controller: _userController,
        decoration: InputDecoration(
            labelText: "USERNAME",
            errorText: _userInvalid ? _uerNameErr : null,
            labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)),
      ),
    );

    final password = Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextField(
            style: TextStyle(fontSize: 18, color: Colors.black),
            obscureText: !_showPass,
            controller: _passController,
            decoration: InputDecoration(
                labelText: "PASSWORD",
                errorText: _passInvalid ? _passErr : null,
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)),
          ),
          GestureDetector(
            onTap: onToggleShowPass,
            child: Text(
              !_showPass ? "Hiển Thị" : "Ẩn",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );

    final button = Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: RaisedButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: onSignInClick,
          child: Text("Đăng nhập",
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );

    final msg = BlocBuilder<AuthBloC, AuthState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthBloC, AuthState>(
          listener: (context, state) {
            if (state is StudentLoginSuccessState) {
              // String id = state.getString();
              // print("id login : " + id);
              return Navigator.pushNamed(context, '/student');
            } else if (state is AdminLoginSuccesState) {
              return Navigator.pushNamed(context, '/admin');
            }
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  logo,
                  title,
                  // msg,
                  username,
                  password,
                  button,
                ],
              ),
            ),
          ),
        ));
  }

  void onSignInClick() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => HomePage()));
    authBloC.add(LoginButtonPress(
        email: _userController.text, password: _passController.text));
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
