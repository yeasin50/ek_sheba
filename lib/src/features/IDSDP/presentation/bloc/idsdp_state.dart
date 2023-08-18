part of 'idsdp_bloc.dart';

abstract class IdsdpState extends Equatable {
  const IdsdpState();  

  @override
  List<Object> get props => [];
}
class IdsdpInitial extends IdsdpState {}

class IdsdpLoading extends IdsdpState {}

// class IdsdpLoaded extends IdsdpState {
//   final List<ProjectDetails> projects;
//   const IdsdpLoaded({required this.projects});
//   @override
//   List<Object> get props => [projects];
// }