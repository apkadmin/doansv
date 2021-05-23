import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitState extends AuthState {}

class LoginLoadingState extends AuthState {}

class StudentLoginSuccessState extends AuthState {
  String id = '';
  String token = '';

  String getStringId() => id;
  void setStringId(String id) => this.id = id;

  String getStringToken() => token;
  void setStringToken(String token) => this.token = token;
}

class AdminLoginSuccesState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState({this.message});
}
