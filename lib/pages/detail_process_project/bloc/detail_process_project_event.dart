part of 'detail_process_project_bloc.dart';

abstract class DetailProcessProjectEvent extends Equatable {
  const DetailProcessProjectEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class GetDetailProcess extends DetailProcessProjectEvent
{
}