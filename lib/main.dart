import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quanly_app/bloc/auth_bloc.dart';
import 'package:quanly_app/events/auth_state.dart';
import 'package:quanly_app/models/student.dart';
import 'package:quanly_app/pages/admin_page.dart';
import 'package:quanly_app/pages/home_page.dart';
import 'package:quanly_app/pages/authen/login_page.dart';
import 'package:quanly_app/service/login_service.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'package:quanly_app/util/hive_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocDirectory = await getApplicationDocumentsDirectory();
  Hive..init(appDocDirectory.path)..registerAdapter(StudentAdapter());
  await Hive.openBox("BOX_USER");
  await Hive.openBox('BOX_SHOW_SPLASH');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Student userModel = HiveUtils().getUser();
    if (userModel!=null){
      print("sssssssssssssssssssssssssssxxxx${userModel.idProject}");
      GlobalCache().setUser(userModel);
      GlobalCache().setToken(userModel.accessToken);
    }
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
        initialRoute: userModel==null?'/':'/student',
        routes: {
          '/': (context) => LoginPage(),
          '/student': (context) => HomePage(),
          '/admin': (context) => AdminPage()
        },
      ),
    );
  }
}
