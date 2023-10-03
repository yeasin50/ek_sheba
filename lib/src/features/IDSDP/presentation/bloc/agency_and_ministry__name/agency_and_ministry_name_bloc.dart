import 'dart:async';

import 'package:ek_sheba/src/common/utils/api_config.dart';
import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_utils/my_utils.dart';

import '../../../domain/entities/agency_and_ministry.dart';

part 'agency_and_ministry_name_event.dart';
part 'agency_and_ministry_name_state.dart';

class AgencyAndMinistryNameBloc
    extends Bloc<AgencyAndMinistryNameEvent, AgencyAndMinistryNameState> {
  AgencyAndMinistryNameBloc() : super(AgencyAndMinistryNameInitial()) {
    on<GetAgencyAndMinistryName>(_onGetAgencyAndMinistryName);
  }

  FutureOr<void> _onGetAgencyAndMinistryName(
    GetAgencyAndMinistryName event,
    Emitter<AgencyAndMinistryNameState> emit,
  ) async {
    try {
      // https://gwtraining.plandiv.gov.bd/pps-configuration/userGroup/getUserGroupByUserId
      final response = await http.get(
          Uri.parse(
              '${APIInfo.baseUrl}pps-configuration/userGroup/getUserGroupByUserId'),
          headers: {
            "Authorization": "Bearer ${await TokenManager.getToken()}",
          });

      if (response.statusCode == 200) {
        final data = AgencyAndMinistryInfo.fromJson(response.body);
        emit(AgencyAndMinistryNameLoaded(data));
      } else {
        logger.e('Something went wrong! ${response.body}');
        emit(AgencyAndMinistryNameError(
            'Something went wrong! ${response.statusCode}'));
      }
    } catch (e) {
      logger.e(e);
      emit(AgencyAndMinistryNameError(e.toString()));
    }
  }
}
