part of 'list_project_bloc.dart';

abstract class ListProjectState extends Equatable {
  const ListProjectState();
}

class ListProjectInitial extends ListProjectState {
  @override
  List<Object> get props => [];
}
class ListProjectLoading extends ListProjectState {
  @override
  List<Object> get props => [];
}
class ListProjectLoaded extends ListProjectState {
  List<Project> list;

  ListProjectLoaded({this.list});

  @override
  List<Object> get props => [list];
}
class ListProjectError extends ListProjectState {
  String error;

  ListProjectError({this.error});

  @override
  List<Object> get props => [error];
}