import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanly_app/models/detail_project.dart';
import 'package:quanly_app/service/detail_project_service.dart';

part 'detail_project_event.dart';

part 'detail_project_state.dart';

class DetailProjectBloc extends Bloc<DetailProjectEvent, DetailProjectState> {
  DetaiProjectService detaiProjectService;

  DetailProjectBloc({this.detaiProjectService}) : super(DetailProjectInitial());

  @override
  Stream<DetailProjectState> mapEventToState(
    DetailProjectEvent event,
  ) async* {
    if (event is LoadDetaiProject) {
      yield* _mapLoadDetailProjec();
    }
  }

  Stream<DetailProjectState> _mapLoadDetailProjec() async* {
    yield DetailProjectLoading();
    var detailProject = await detaiProjectService.getDetatil();
    if (detailProject != null) {
      yield DetailProjectLoaded(detailProject: detailProject);
    } else {
      yield DetailProjectErros(erros: "Bạn chưa đăng ký project !");
    }
  }
}
