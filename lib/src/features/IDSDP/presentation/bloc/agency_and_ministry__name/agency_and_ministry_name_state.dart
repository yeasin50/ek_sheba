part of 'agency_and_ministry_name_bloc.dart';

sealed class AgencyAndMinistryNameState extends Equatable {
  const AgencyAndMinistryNameState();

  @override
  List<Object> get props => [];
}

final class AgencyAndMinistryNameInitial extends AgencyAndMinistryNameState {}

final class AgencyAndMinistryNameLoading extends AgencyAndMinistryNameState {}

final class AgencyAndMinistryNameLoaded extends AgencyAndMinistryNameState {
  final AgencyAndMinistryInfo agencyAndMinistryInfo;

  const AgencyAndMinistryNameLoaded(this.agencyAndMinistryInfo);

  @override
  List<Object> get props => [agencyAndMinistryInfo];
}

final class AgencyAndMinistryNameError extends AgencyAndMinistryNameState {
  final String message;

  const AgencyAndMinistryNameError(this.message);

  @override
  List<Object> get props => [message];
}
