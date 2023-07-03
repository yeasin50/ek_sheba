part of 'faq_bloc.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

class FaqFetchEvent extends FaqEvent {
  const FaqFetchEvent();
  @override
  List<Object> get props => [];
}

class FaqSearchEvent extends FaqEvent {
  final String query;
  const FaqSearchEvent(this.query);
  @override
  List<Object> get props => [query];
}
