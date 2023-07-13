part of 'guideline_bloc.dart';

abstract class GuidelineEvent extends Equatable {
  const GuidelineEvent();

  @override
  List<Object?> get props => [];
}

class GuidelineFetchEvent extends GuidelineEvent {
  const GuidelineFetchEvent();
  @override
  List<Object> get props => [];
}

//fetch guideline by module id
class GuidelineSelectEvent extends GuidelineEvent {
  final String? imsModuleId;
  const GuidelineSelectEvent({this.imsModuleId});
  @override
  List<Object?> get props => [imsModuleId];
}
