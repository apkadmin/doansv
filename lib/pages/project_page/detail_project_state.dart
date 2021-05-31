part of 'detail_project_bloc.dart';

abstract class DetailProjectState extends Equatable {
  const DetailProjectState();
  @override
  List<Object> get props => [];

}

class DetailProjectInitial extends DetailProjectState {
  @override
  List<Object> get props => [];
}
class DetailProjectLoading extends DetailProjectState {}
class DetailProjectLoaded extends DetailProjectState {
  DetailProject detailProject;

  DetailProjectLoaded({this.detailProject});

  @override
  List<Object> get props => [detailProject];
}
class DetailProjectErros extends DetailProjectState {
  String erros;

  DetailProjectErros({this.erros});
  @override
  List<Object> get props => [erros];
}
