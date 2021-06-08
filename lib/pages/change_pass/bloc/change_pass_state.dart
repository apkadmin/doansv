part of 'change_pass_bloc.dart';

abstract class ChangePassState extends Equatable {
  const ChangePassState();
  @override
  List<Object> get props => [];
}

class ChangePassInitial extends ChangePassState {
  @override
  List<Object> get props => [];
}
class ChangePassLoading extends ChangePassState {
  @override
  List<Object> get props => [];
}
class ChangePassLoaded extends ChangePassState {
  @override
  List<Object> get props => [];
}
class ChangePassError extends ChangePassState {
  String erros;

  ChangePassError(this.erros);

  @override
  List<Object> get props => [erros];
}