import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanly_app/models/process_stage.dart';
import 'package:quanly_app/service/detail_process_service.dart';

part 'detail_process_project_event.dart';
part 'detail_process_project_state.dart';

class DetailProcessProjectBloc extends Bloc<DetailProcessProjectEvent, DetailProcesssProjectState> {
  DetailProcessService detailProcessService;
  DetailProcessProjectBloc({this.detailProcessService}) : super(DetailProcessProjectInitial());
  @override
  Stream<DetailProcesssProjectState> mapEventToState(
    DetailProcessProjectEvent event,
  ) async* {
    if(event is GetDetailProcess)
      {
        yield* _mapLoadedProcessProject();
      }

  }
  Stream<DetailProcesssProjectState> _mapLoadedProcessProject() async*
  {
    yield DetailProcessProjectLoading();
    var data = await detailProcessService.getDetatil();
    if(data!=null)
      {
        yield DetailProcessProjectLoaded(processStage: data);
      }
    else
      {
        yield DetailProcessProjectErros(erros: "erros");
      }

  }
}
