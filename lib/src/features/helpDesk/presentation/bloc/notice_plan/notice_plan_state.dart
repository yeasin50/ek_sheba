part of 'notice_plan_bloc.dart';

abstract class NoticePlanState extends Equatable {
  const NoticePlanState();
  
  @override
  List<Object> get props => [];
}

class NoticePlanInitial extends NoticePlanState {}

class NoticePlanLoading extends NoticePlanState {}

class NoticePlanError extends NoticePlanState {
  final String message;

  const NoticePlanError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class NoticePlanLoaded extends NoticePlanState {
  final List<NoticeInfo> notices;

  const NoticePlanLoaded({
    required this.notices,
  });

  @override
  List<Object> get props => [notices];
}