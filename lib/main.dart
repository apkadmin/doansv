import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/bloc/auth_bloc.dart';
import 'package:quanly_app/events/auth_state.dart';
import 'package:quanly_app/pages/admin_page.dart';
import 'package:quanly_app/pages/home_page.dart';
import 'package:quanly_app/pages/authen/login_page.dart';
import 'package:quanly_app/service/login_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloC(LoginInitState(), AuthService()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/student': (context) => HomePage(),
          '/admin': (context) => AdminPage()
        },
      ),
    );
  }
}
