part of 'change_pass_bloc.dart';

abstract class ChangePassEvent extends Equatable {
  const ChangePassEvent();
}
class RequestChangePass extends ChangePassEvent{
  String oldPass;
  String newPass;

  RequestChangePass({this.oldPass, this.newPass});
  @override
  // TODO: implement props
  List<Object> get props => [oldPass,newPass];
}