import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/events/auth_events.dart';
import 'package:quanly_app/events/auth_state.dart';
import 'package:quanly_app/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  AuthBloC extends Bloc<AuthEvents, AuthState> {
  AuthService repo;
  AuthBloC(AuthState initialState, this.repo) : super(initialState) {
     on<StartEvent>((event, emit) => emit( LoginInitState()));
       on<LoginButtonPress>((event, emit) async {
          var pref = await SharedPreferences.getInstance();
         emit(LoginLoadingState());
         print("call api");
      var data = await repo.Login(event.email, event.password);
      if (data['message'] == "Invalid Password!") {
        pref.setString('message', data['message']);
        pref.setString('accessToken', data['accessToken']);
        emit( LoginErrorState(message: "auth error"));
      }



      else if (data['role'] == 'student') {
        pref.setString('accessToken', data['accessToken']);
        pref.setString('id', data['id']);
        pref.setString('email', data['email']);
        pref.setString('idStudent', data['idStudent']);
        pref.setString('nameStudent', data['nameStudent']);
        pref.setString('birthday', data['birthday']);
        pref.setString('address', data['address']);
        pref.setString('phone', data['phone']);
        pref.setString('code', data['code']);
        pref.setString('email', data['email']);
        pref.setString('idClass', data['idClass']);
        pref.setString('majors', data['majors']);
        pref.setString('schoolYear', data['schoolYear']);
        pref.setString('image', data['image']);
        StudentLoginSuccessState state = StudentLoginSuccessState();
        state.setStringId(data['id']);
        state.setStringToken(data['accessToken']);
        emit( state);
      } else if (data['role'] == 'admin') {
        pref.setString('accessToken', data['accessToken']);
        pref.setString('id', data['id']);
        pref.setString('email', data['email']);
      }
      else{
        emit( LoginErrorState(message: "auth error"));
      }
       });
  }

  // Stream<AuthState> mapEventToState(AuthEvents event) async* {
  //   var pref = await SharedPreferences.getInstance();
  //   if (event is StartEvent) {
  //     yield LoginInitState();
  //   } else if (event is LoginButtonPress) {
  //     yield LoginLoadingState();
  //     var data = await repo.Login(event.email, event.password);
  //     if (data['message'] == "Invalid Password!") {
  //       pref.setString('message', data['message']);
  //       pref.setString('accessToken', data['accessToken']);
  //       yield LoginErrorState(message: "auth error");
  //     }



  //     else if (data['role'] == 'student') {
  //       pref.setString('accessToken', data['accessToken']);
  //       pref.setString('id', data['id']);
  //       pref.setString('email', data['email']);
  //       pref.setString('idStudent', data['idStudent']);
  //       pref.setString('nameStudent', data['nameStudent']);
  //       pref.setString('birthday', data['birthday']);
  //       pref.setString('address', data['address']);
  //       pref.setString('phone', data['phone']);
  //       pref.setString('code', data['code']);
  //       pref.setString('email', data['email']);
  //       pref.setString('idClass', data['idClass']);
  //       pref.setString('majors', data['majors']);
  //       pref.setString('schoolYear', data['schoolYear']);
  //       pref.setString('image', data['image']);
  //       StudentLoginSuccessState state = StudentLoginSuccessState();
  //       state.setStringId(data['id']);
  //       state.setStringToken(data['accessToken']);
  //       yield state;
  //     } else if (data['role'] == 'admin') {
  //       pref.setString('accessToken', data['accessToken']);
  //       pref.setString('id', data['id']);
  //       pref.setString('email', data['email']);
  //     }
  //     else{
  //       yield LoginErrorState(message: "auth error");
  //     }
  //   }
  // }
}
