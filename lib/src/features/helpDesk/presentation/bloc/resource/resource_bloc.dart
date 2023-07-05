import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/repositories/resouce_repository_impl.dart';
import '../../../domain/entities/resource_filterlist.dart';
import '../../../domain/entities/resource_info.dart';

part 'resource_event.dart';
part 'resource_state.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState> {
  final ResourceRepositoryImpl _repo;

  /// main data from  [Get Filter List]
  ///  hold the data for dropdown
  ResourceFilterInfo? filterInfo;

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
      (ResourceFilterInfo r) {
        filterInfo = r;
        emit(state.copyWith(resourceInfo: r));
      },
    );
  }

  FutureOr<void> _onCategoryChange(OnCategoryChange event, Emitter<ResourceState> emit) async {
    logger.e("_onCategoryChange ${event.category}");

    if (event.category?.toLowerCase() == "all") {
      logger.i("${state.resourceInfo}");

      final rsInfo = state.resourceInfo?.copyWith(
        yearList: [...filterInfo?.yearList ?? []],
        monthList: [...filterInfo?.monthList ?? []],
        categoryList: [...filterInfo?.categoryList ?? []],
      );
      emit(
        state.copyWith(
          selectedCategory: () => "All",
          resourceInfo: rsInfo,
          selectedYear: () => null,
          selectedMonth: () => null,
        ),
      );
      return;
    }

    //else
    emit(state.copyWith(
      selectedCategory: () => event.category,
      selectedYear: () => null,
      selectedMonth: () => null,
    ));
    final result = await _repo.getYearListByCategory(event.category!);

    result.fold(
      (l) => logger.e(l.toString()),
      (r) {
        emit(state.copyWith(
          resourceInfo: state.resourceInfo?.copyWith(yearList: r),
        ));
      },
    );
  }

  FutureOr<void> _onYearChange(OnYearChange event, Emitter<ResourceState> emit) async {
    if (event.year?.toLowerCase() == "all") {
      emit(
        state.copyWith(
          resourceInfo: state.resourceInfo?.copyWith(
            monthList: [...filterInfo?.monthList ?? []],
            categoryList: [...filterInfo?.categoryList ?? []],
          ),
          selectedMonth: () => null,
        ),
      );
      return;
    }
    emit(state.copyWith(
      selectedYear: () => event.year,
      selectedMonth: () => null,
    ));

    final result = await _repo.getMonthListByYear(event.year ?? "");

    result.fold(
      (l) => logger.e(l.toString()),
      (r) {
        logger.e(r.toString());
        emit(state.copyWith(
          resourceInfo: state.resourceInfo?.copyWith(monthList: r),
        ));
      },
    );
  }

  FutureOr<void> _onMonthChange(OnMonthChange event, Emitter<ResourceState> emit) async {
    if (event.month?.toLowerCase() == "all") {
      emit(
        state.copyWith(
          selectedMonth: () => "All",
          resourceInfo: state.resourceInfo?.copyWith(
            categoryList: [...filterInfo?.categoryList ?? []],
          ),
        ),
      );
      return;
    }
    logger.e("_onMonthChange ${event.month}");
    emit(state.copyWith(selectedMonth: () => event.month));
  }

  FutureOr<void> _onSearch(ResourceSearchRequested event, Emitter<ResourceState> emit) async {}
}
