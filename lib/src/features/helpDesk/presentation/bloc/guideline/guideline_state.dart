part of 'guideline_bloc.dart';

abstract class GuidelineState extends Equatable {
  const GuidelineState();

  @override
  List<Object?> get props => [];
}

class GuidelineInitial extends GuidelineState {
  const GuidelineInitial();
}

class GuidelineLoading extends GuidelineState {
  const GuidelineLoading();
}

class GuidelineError extends GuidelineState {
  const GuidelineError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class GuidelineLoaded extends GuidelineState {
  const GuidelineLoaded({
    required this.selectedGuidelineId,
    required this.guidelines,
    required this.isListLoading,
    this.guidelineList,
  });

  final String selectedGuidelineId;

  ///used on top list
  final List<GuideLineInfo> guidelines;
  final bool isListLoading;

  ///used to preview on selected guideline
  final List<GuideLineInfo>? guidelineList;
  @override
  List<Object?> get props =>
      [selectedGuidelineId, guidelines, guidelineList, isListLoading];

  @override
  String toString() =>
      'GuidelineLoaded(selectedGuidelineId: $selectedGuidelineId, guidelines: $guidelines, guidelineList: $guidelineList)';

  GuidelineLoaded copyWith({
    String? selectedGuidelineId,
    List<GuideLineInfo>? guidelines,
    bool? isListLoading,
    List<GuideLineInfo>? guidelineList,
  }) {
    return GuidelineLoaded(
      selectedGuidelineId: selectedGuidelineId ?? this.selectedGuidelineId,
      guidelines: guidelines ?? this.guidelines,
      isListLoading: isListLoading ?? this.isListLoading,
      guidelineList: guidelineList ?? this.guidelineList,
    );
  }
}
