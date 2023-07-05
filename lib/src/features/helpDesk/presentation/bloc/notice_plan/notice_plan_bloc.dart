import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/notice_info.dart';
import '../../../domain/repositories/notice_plan_repository.dart';

part 'notice_plan_event.dart';
part 'notice_plan_state.dart';

class NoticePlanBloc extends Bloc<NoticePlanEvent, NoticePlanState> {
  final INoticePlanRepository _repo;
  NoticePlanBloc(this._repo) : super(NoticePlanInitial()) {
    // on<OnDateRangeSelected>(_onDateRangeSelected);
    on<OnSearch>(_onSearch);
  }

  FutureOr<void> _onSearch(OnSearch event, Emitter<NoticePlanState> emit) async {
    emit(NoticePlanLoading());
    final result = await _repo.search(
      query: event.searchText,
      fromDate: event.fromDate,
      toDate: event.toDate,
    );
    result.fold(
      (l) => emit(NoticePlanError(message: "Failed to load notices")),
      (r) => emit(NoticePlanLoaded(notices: r)),
    );
  }
}
