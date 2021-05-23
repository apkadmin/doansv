import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_process_project_event.dart';
part 'detail_process_project_state.dart';

class DetailProcessProjectBloc extends Bloc<DetailProcessProjectEvent, DetailProcessProjectState> {
  DetailProcessProjectBloc() : super(DetailProcessProjectInitial());

  @override
  Stream<DetailProcessProjectState> mapEventToState(
    DetailProcessProjectEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
