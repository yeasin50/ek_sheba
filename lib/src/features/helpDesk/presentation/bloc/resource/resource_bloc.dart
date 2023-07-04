import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
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
    on<OnCategoryChange>(_onCategoryChange);
    on<OnYearChange>(_onYearChange);
    on<OnMonthChange>(_onMonthChange);

    on<ResourceSearchRequested>(_onSearch);
  }

  //initial list
  FutureOr<void> _onActiveListRequest(ResourceActiveListRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getActiveList();

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) => emit(state.copyWith(resourceList: r)),
    );
  }

  FutureOr<void> _onFilterListRequest(ResourceFilterRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getFilterList();

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) => emit(state.copyWith(resourceInfo: r)),
    );
  }

  FutureOr<void> _onCategoryChange(OnCategoryChange event, Emitter<ResourceState> emit) async {
    logger.e("_onCategoryChange ${event.category}");

    emit(state.copyWith(selectedCategory: event.category));
    final result = await _repo.getYearListByCategory(event.category);

    result.fold(
      (l) => logger.e(l.toString()),
      (r) {
        logger.e(r.toString());
        emit(state.copyWith(
          resourceInfo: state.resourceInfo?.copyWith(yearList: r),
          selectedYear: null,
          selectedMonth: null,
        ));
      },
    );
  }

  FutureOr<void> _onYearChange(OnYearChange event, Emitter<ResourceState> emit) async {
    final result = await _repo.getMonthListByYear(event.year);

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (r) {
        emit(state.copyWith(resourceInfo: state.resourceInfo?.copyWith(monthList: r)));
      },
    );
  }

  FutureOr<void> _onMonthChange(OnMonthChange event, Emitter<ResourceState> emit) {}

  FutureOr<void> _onSearch(ResourceSearchRequested event, Emitter<ResourceState> emit) async {}
}
