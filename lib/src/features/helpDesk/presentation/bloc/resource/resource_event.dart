part of 'resource_bloc.dart';

abstract class ResourceEvent extends Equatable {
  const ResourceEvent();

  @override
  List<Object?> get props => [];
}

class ResourceFilterRequested extends ResourceEvent {}

class ResourceActiveListRequested extends ResourceEvent {}

class OnCategoryChange extends ResourceEvent {
  final String? category;

  const OnCategoryChange({required this.category});

  @override
  List<Object?> get props => [category];
}

class OnYearChange extends ResourceEvent {
  final String? year;

  const OnYearChange({required this.year});

  @override
  List<Object?> get props => [year];
}

class OnMonthChange extends ResourceEvent {
  final String? month;

  const OnMonthChange({required this.month});

  @override
  List<Object?> get props => [month];
}

class ResourceSearchRequested extends ResourceEvent {
  final String? category;
  final String? year;
  final String? month;

  const ResourceSearchRequested({
    required this.category,
    required this.year,
    required this.month,
  });

  @override
  List<Object?> get props => [category, year, month];
}

class ResourceFilterListRefreshRequested extends ResourceEvent {}
