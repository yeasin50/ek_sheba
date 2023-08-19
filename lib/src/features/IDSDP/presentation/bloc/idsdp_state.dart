part of 'idsdp_bloc.dart';

abstract class IdsdpState extends Equatable {
  const IdsdpState();  

  @override
  List<Object> get props => [];
}
class IdsdpInitial extends IdsdpState {}

class IdsdpLoading extends IdsdpState {}

class IdsdpLoaded extends IdsdpState {
  const IdsdpLoaded();
  @override
  List<Object> get props => [];
}