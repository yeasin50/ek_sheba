part of 'resource_bloc.dart';

abstract class ResourceEvent extends Equatable {
  const ResourceEvent();

  @override
  List<Object?> get props => [];
}

class ResourceFilterRequested extends ResourceEvent {}

class ResourceActiveListRequested extends ResourceEvent {}

class ResourceYearListRequested extends ResourceEvent {
  final String category;

  const ResourceYearListRequested({required this.category});

  @override
  List<Object> get props => [category];
}

class ResourceMonthListRequested extends ResourceEvent {
  final String year;

  const ResourceMonthListRequested({required this.year});

  @override
  List<Object> get props => [year];
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
