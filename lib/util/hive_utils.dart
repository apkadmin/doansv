import 'package:hive/hive.dart';
import 'package:quanly_app/models/student.dart';


final userBox = Hive.box('BOX_USER');
final showSplashBox = Hive.box("BOX_SHOW_SPLASH");


class HiveUtils {
  static HiveUtils shared = HiveUtils();
  Student getUser() {
    final data = userBox
        .get('BOX_USER', defaultValue: null);
    return data;
  }

  setUserData(Student userModel) {
    userBox.put('BOX_USER', userModel);
  }
  setStateShowSplash(String isShow){
    showSplashBox.put("BOX_SHOW_SPLASH", isShow);
  }
  getStateShowSplash(){
    final data = showSplashBox
        .get("BOX_SHOW_SPLASH", defaultValue: null);
    return data;
  }
}
