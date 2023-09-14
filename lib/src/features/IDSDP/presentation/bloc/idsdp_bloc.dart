import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/dashboard_projects_repo_impl.dart';

part 'idsdp_event.dart';
part 'idsdp_state.dart';

class IdsdpBloc extends Bloc<IdsdpEvent, IdsdpState> {
  IdsdpBloc() : super(IdsdpInitial()) {
    on<LoadProjectsEvent>(_onLoadProjects);
  }

  FutureOr<void> _onLoadProjects(LoadProjectsEvent event, Emitter<IdsdpState> emit) async {
    emit(IdsdpLoading());
    final result = await locator<DashboardProjectRepoImpl>().loadProjects();

    result.fold(
      (l) => emit(IdsdpError("Failed to load data. ${l.message}")),
      (r) => emit(IdsdpLoaded(locator<DashboardProjectRepoImpl>())),
    );
  }
}
