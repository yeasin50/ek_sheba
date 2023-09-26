part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqLoaded extends FaqState {
  final List<FAQModule> faqList;
  const FaqLoaded(this.faqList);
  @override
  List<Object> get props => [faqList];
}

class FaqError extends FaqState {
  final String message;
  const FaqError(this.message);
  @override
  List<Object> get props => [message];
}
