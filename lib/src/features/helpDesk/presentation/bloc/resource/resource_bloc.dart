import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/resouce_repository_impl.dart';
import '../../../domain/entities/resource_filterlist.dart';
import '../../../domain/entities/resource_info.dart';

part 'resource_event.dart';
part 'resource_state.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState> {
  final ResourceRepositoryImpl _repo;

  ResourceBloc(this._repo) : super(const ResourceInitial()) {
    on<ResourceFilterRequested>(_onFilterListRequest);
    on<ResourceActiveListRequested>(_onActiveListRequest);
    on<ResourceYearListRequested>(_onYearListRequest);
    on<ResourceMonthListRequested>(_onMonthListRequest);

    on<ResourceSearchRequested>(_onSearch);
  }

  FutureOr<void> _onFilterListRequest(ResourceFilterRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getFilterList();

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) => emit(state.copyWith(resourceInfo: r)),
    );
  }

  //initial list
  FutureOr<void> _onActiveListRequest(ResourceActiveListRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getActiveList();

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) => emit(state.copyWith(resourceList: r)),
    );
  }

  FutureOr<void> _onYearListRequest(ResourceYearListRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getYearListByCategory(event.category);

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) {
        emit(state.copyWith(resourceInfo: state.resourceInfo?.copyWith(yearList: r)));
      },
    );
  }

  FutureOr<void> _onMonthListRequest(ResourceMonthListRequested event, Emitter<ResourceState> emit) {}

  FutureOr<void> _onSearch(ResourceSearchRequested event, Emitter<ResourceState> emit) async {}
}
