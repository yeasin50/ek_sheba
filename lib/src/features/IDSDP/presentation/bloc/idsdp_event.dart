part of 'idsdp_bloc.dart';

abstract class IdsdpEvent extends Equatable {
  const IdsdpEvent();

  @override
  List<Object> get props => [];
}

class LoadProjectsEvent extends IdsdpEvent {}
