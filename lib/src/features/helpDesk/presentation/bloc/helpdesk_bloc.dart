import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'helpdesk_event.dart';
part 'helpdesk_state.dart';

class HelpdeskBloc extends Bloc<HelpdeskEvent, HelpdeskState> {
  HelpdeskBloc() : super(HelpdeskInitial()) {
    on<HelpdeskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
