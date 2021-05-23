import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartEvent extends UserEvent {}

class GetUserEvent extends UserEvent {
  final String idUser;
  final String tokenAuthen;

  GetUserEvent({this.idUser, this.tokenAuthen});
}
