part of 'idsdp_bloc.dart';

abstract class IdsdpState extends Equatable {
  const IdsdpState();

  @override
  List<Object> get props => [];
}

class IdsdpInitial extends IdsdpState {}

class IdsdpLoading extends IdsdpState {}

class IdsdpLoaded extends IdsdpState {
  const IdsdpLoaded(this.repo);

  final DashboardProjectRepoImpl repo;
  @override
  List<Object> get props => [repo];
}

class IdsdpError extends IdsdpState {
  const IdsdpError(this.message);

  final String message;
  @override
  List<Object> get props => [message];
}
