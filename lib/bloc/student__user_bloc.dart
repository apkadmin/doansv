import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/events/user_events.dart';
import 'package:quanly_app/events/user_state.dart';
import 'package:quanly_app/service/student_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentBloC extends Bloc<UserEvent, UserState> {
  StudentService repo;

  StudentBloC(UserState initialState, this.repo) : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    var student = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield UserInitState();
    } else if (event is GetUserEvent) {
      yield UserLoadingState();
      var data = await repo.GetUser(event.idUser, event.tokenAuthen);
      if (data) {
        student.setString('name', data['name']);
      } else {
        yield UserErrorState(message: "cant get User info");
      }
    }
  }
}
