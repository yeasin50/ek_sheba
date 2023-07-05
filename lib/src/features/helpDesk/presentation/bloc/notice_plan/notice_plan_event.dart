part of 'notice_plan_bloc.dart';

abstract class NoticePlanEvent extends Equatable {
  const NoticePlanEvent();

  @override
  List<Object?> get props => [];
}

class InitialLoad extends NoticePlanEvent {}

class OnSearch extends NoticePlanEvent {
  final String? searchText;
  final DateTime? fromDate;
  final DateTime? toDate;

  const OnSearch({
    this.searchText,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Object?> get props => [searchText, fromDate, toDate];
}
