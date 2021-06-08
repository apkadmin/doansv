import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanly_app/service/change_pass_service.dart';

part 'change_pass_event.dart';
part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  ChangePassService changePassService;
  ChangePassBloc({this.changePassService}) : super(ChangePassInitial());

  @override
  Stream<ChangePassState> mapEventToState(
    ChangePassEvent event,
  ) async* {
    if(event is RequestChangePass)
      {
        yield* _mapRequestChangePass(event);
      }

  }
  Stream<ChangePassState> _mapRequestChangePass(RequestChangePass requestChangePass) async*
  {
      yield ChangePassLoading();
      var data = changePassService.changePass(newPass: requestChangePass.newPass,oldPass: requestChangePass.oldPass);
      if(data != null)
        {
          yield ChangePassLoaded();
        }
      else {
        yield ChangePassError(data["message"]);
      }
  }
}
