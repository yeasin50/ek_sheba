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
  ResourceFilterInfo? _filterInfo;
  List<ResourceInfo> _initResourceList = [];

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
      (r) {
        _initResourceList = r;
        emit(state.copyWith(resourceList: r));
      },
    );
  }

  FutureOr<void> _onFilterListRequest(ResourceFilterRequested event, Emitter<ResourceState> emit) async {
    final result = await _repo.getFilterList();

    result.fold(
      (l) => emit(const ResourceFilterLoadFailure()),
      (ResourceFilterInfo r) {
        _filterInfo = r;
        emit(state.copyWith(resourceInfo: r));
      },
    );
  }

  FutureOr<void> _onCategoryChange(OnCategoryChange event, Emitter<ResourceState> emit) async {
    logger.e("_onCategoryChange ${event.category}");

    if (event.category?.toLowerCase() == "all") {
      logger.i("${state.resourceInfo}");

      final rsInfo = state.resourceInfo?.copyWith(
        yearList: [..._filterInfo?.yearList ?? []],
        monthList: [..._filterInfo?.monthList ?? []],
        categoryList: [..._filterInfo?.categoryList ?? []],
      );
      emit(
        state.copyWith(
          selectedCategory: () => "All",
          resourceList: _initResourceList,
          resourceInfo: rsInfo,
          selectedYear: () => null,
          selectedMonth: () => null,
        ),
      );

      ///! this is a hack to get the search result
     
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
        emit(state.copyWith(resourceInfo: state.resourceInfo?.copyWith(yearList: r)));

        ///! this is a hack to get the search result
        add(const ResourceSearchRequested());
      },
    );
  }

  FutureOr<void> _onYearChange(OnYearChange event, Emitter<ResourceState> emit) async {
    if (event.year?.toLowerCase() == "all") {
      emit(
        state.copyWith(
          resourceInfo: state.resourceInfo?.copyWith(
            monthList: [..._filterInfo?.monthList ?? []],
            categoryList: [..._filterInfo?.categoryList ?? []],
          ),
          selectedMonth: () => null,
        ),
      );

      ///! this is a hack to get the search result
      add(const ResourceSearchRequested());
      return;
    }

    //else
    emit(state.copyWith(
      selectedYear: () => event.year,
      selectedMonth: () => null,
    ));

    final result = await _repo.getMonthListByYear(event.year ?? "");

    result.fold(
      (l) => logger.e(l.toString()),
      (r) {
        logger.e(r.toString());
        emit(state.copyWith(resourceInfo: state.resourceInfo?.copyWith(monthList: r)));

        ///! this is a hack to get the search result
        add(const ResourceSearchRequested());
      },
    );
  }

  FutureOr<void> _onMonthChange(OnMonthChange event, Emitter<ResourceState> emit) async {
    if (event.month?.toLowerCase() == "all") {
      emit(
        state.copyWith(
          selectedMonth: () => "All",
          resourceInfo: state.resourceInfo?.copyWith(categoryList: [..._filterInfo?.categoryList ?? []]),
        ),
      );

      ///! this is a hack to get the search result
      add(const ResourceSearchRequested());
      return;
    }
    logger.e("_onMonthChange ${event.month}");
    emit(state.copyWith(selectedMonth: () => event.month));

    ///! this is a hack to get the search result
    add(const ResourceSearchRequested());
  }

  FutureOr<void> _onSearch(ResourceSearchRequested event, Emitter<ResourceState> emit) async {
    logger.d("_onSearch ${state.selectedCategory} ${state.selectedYear} ${state.selectedMonth}");

    final result = await _repo.searchResource(
      category: state.selectedCategory == "All" ? null : state.selectedCategory,
      year: state.selectedYear == "All" ? null : state.selectedYear,
      month: state.selectedMonth == "All" ? null : state.selectedMonth,
    );

    result.fold(
      (l) => logger.e(l.toString()),
      (r) {
        logger.e(r.toString());
        emit(state.copyWith(resourceList: r));
      },
    );
  }
}
