part of 'resource_bloc.dart';

class ResourceState extends Equatable {
  const ResourceState({
    this.resourceInfo,
    this.resourceList = const [],
    this.selectedCategory,
    this.selectedYear,
    this.selectedMonth,
  });

  final ResourceFilterInfo? resourceInfo;
  final List<ResourceInfo> resourceList;

  final String? selectedCategory;
  final String? selectedYear;
  final String? selectedMonth;

  @override
  List<Object?> get props => [resourceInfo, resourceList, selectedCategory, selectedYear, selectedMonth];

  ResourceState copyWith({
    ResourceFilterInfo? resourceInfo,
    List<ResourceInfo>? resourceList,
    String? selectedCategory,
    String? selectedYear,
    String? selectedMonth,
  }) {
    return ResourceState(
      resourceInfo: resourceInfo ?? this.resourceInfo,
      resourceList: resourceList ?? this.resourceList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedYear: selectedYear ?? this.selectedYear,
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }
}

class ResourceInitial extends ResourceState {
  const ResourceInitial();
}

class ResourceFilterLoadInProgress extends ResourceState {
  const ResourceFilterLoadInProgress();
}

class ResourceFilterLoadFailure extends ResourceState {
  const ResourceFilterLoadFailure();
}
