import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/faq_info.dart';
import '../../../domain/repositories/faq_repository.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final IFaqRepository _faqRepository;
  FaqBloc(this._faqRepository) : super(FaqInitial()) {
    on<FaqFetchEvent>(_onFetchFaq);
    on<FaqSearchEvent>(_onSearchFaq);
  }

  FutureOr<void> _onFetchFaq(FaqFetchEvent event, Emitter<FaqState> emit) async {
    emit(FaqLoading());
    final result = await _faqRepository.getFaq();
    result.fold(
      (failure) => emit(const FaqError("Failed to load FAQ")),
      (faqList) => emit(FaqLoaded(faqList)),
    );
  }

  FutureOr<void> _onSearchFaq(FaqSearchEvent event, Emitter<FaqState> emit) async {
    emit(FaqLoading());
    final result = await _faqRepository.searchFaq(event.query);
    result.fold(
      (failure) => emit(FaqError("Failed to load faq")),
      (faqList) => emit(FaqLoaded(faqList)),
    );
  }
}
