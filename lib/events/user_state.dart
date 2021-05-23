import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserGetDataSuccessState extends UserState {}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({this.message});
}
