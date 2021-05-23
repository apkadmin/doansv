import 'package:equatable/equatable.dart';

class AuthEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartEvent extends AuthEvents {}

class LoginButtonPress extends AuthEvents {
  final String email;
  final String password;

  LoginButtonPress({this.email, this.password});
}
