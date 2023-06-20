import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'idsdp_event.dart';
part 'idsdp_state.dart';

class IdsdpBloc extends Bloc<IdsdpEvent, IdsdpState> {
  IdsdpBloc() : super(IdsdpInitial()) {
    on<IdsdpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
