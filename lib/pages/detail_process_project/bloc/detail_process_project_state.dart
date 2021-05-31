part of 'detail_process_project_bloc.dart';

abstract class DetailProcesssProjectState extends Equatable {
  const DetailProcesssProjectState();
  @override
  List<Object> get props => [];
}

class DetailProcessProjectInitial extends DetailProcesssProjectState {
  @override
  List<Object> get props => [];
}
class DetailProcessProjectLoading extends DetailProcesssProjectState
{

}
class DetailProcessProjectLoaded extends DetailProcesssProjectState
{
  ProcessStage processStage;

  DetailProcessProjectLoaded({this.processStage});
  @override
  // TODO: implement props
  List<Object> get props => [processStage];
}
class DetailProcessProjectErros extends DetailProcesssProjectState
{
  String erros;

  DetailProcessProjectErros({this.erros});
  @override
  // TODO: implement props
  List<Object> get props => [erros];
}