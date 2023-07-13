import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/guideline_info.dart';
import '../../../domain/repositories/guideline_repository.dart';

part 'guideline_event.dart';
part 'guideline_state.dart';

class GuidelineBloc extends Bloc<GuidelineEvent, GuidelineState> {
  final IGuidelineRepository _guidelineRepository;

  GuidelineBloc(this._guidelineRepository) : super(const GuidelineInitial()) {
    on<GuidelineFetchEvent>(_onFetchGuideline);
    on<GuidelineSelectEvent>(_onSelectGuideline);
  }

  ///initial fetch
  FutureOr<void> _onFetchGuideline(GuidelineFetchEvent event, Emitter<GuidelineState> emit) async {
    emit(const GuidelineLoading());
    final result = await _guidelineRepository.getGuidelines();
    result.fold(
      (failure) => emit(const GuidelineError("Failed to load guidelines")),
      (guidelineList) {
        if (guidelineList.isEmpty) {
          emit(const GuidelineError("No guideline found"));
          return;
        }
        emit(GuidelineLoaded(
          selectedGuidelineId: guidelineList.first.uuid,
          guidelines: guidelineList,
          isListLoading: true,
        ));
        if (guidelineList.isNotEmpty) add(GuidelineSelectEvent(imsModuleId: guidelineList.first.uuid));
      },
    );
  }

  ///get module list by module id
  FutureOr<void> _onSelectGuideline(GuidelineSelectEvent event, Emitter<GuidelineState> emit) async {
    _loadDataOnGuidelineLoaded() async {
      if (event.imsModuleId == null) return;
      emit((state as GuidelineLoaded).copyWith(
        isListLoading: true,
        selectedGuidelineId: event.imsModuleId ?? "",
      ));

      final result = await _guidelineRepository.getGuidelinesByModule(imsModuleId: event.imsModuleId);
      result.fold(
        (failure) => emit(const GuidelineError("Failed to load guidelines")),
        (guidelineList) async {
          emit((state as GuidelineLoaded).copyWith(
            isListLoading: false,
            guidelineList: guidelineList,
          ));
        },
      );
    }

    if (state is! GuidelineLoaded) {
      emit(const GuidelineLoading());
      add(const GuidelineFetchEvent());
    } else {
      await _loadDataOnGuidelineLoaded();
    }
  }
}
