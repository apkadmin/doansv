import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/service/project_service.dart';

part 'list_project_event.dart';
part 'list_project_state.dart';

class ListProjectBloc extends Bloc<ListProjectEvent, ListProjectState> {
  ProjectService projectService;
  ListProjectBloc({this.projectService}) : super(ListProjectInitial());

  @override
  Stream<ListProjectState> mapEventToState(
    ListProjectEvent event,
  ) async* {
    if(event is LoadListProjectEvent)
      {
        yield* _mapGetListPorject();
      }
  }
  Stream<ListProjectState> _mapGetListPorject() async*
  {
    yield ListProjectLoading();
    var data = await projectService.browse();
    if(data !=null)
      {
        yield ListProjectLoaded(list:data );

      }
    else{
      yield ListProjectError(error: "Có lỗi khi lấy dữ liệu");
    }
  }
}
