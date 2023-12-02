import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/common/resources/data_state.dart';
import 'package:looky/domain/logic/api_repository.dart';
import 'package:looky/infrastructure/model/barber_service_model.dart';

part 'barber_service_state.dart';
part 'barber_service_data_status.dart';

class BarberServiceCubit extends Cubit<BarberServiceState> {
  final ApiRepository apiRepository;
  BarberServiceCubit(this.apiRepository)
      : super(BarberServiceState(dataStatus: BarberServiceDataLoading()));

  Future<void> callBarberServiceDataEvent() async {
    // emit loading
    emit(state.copyWith(newDataStatus: BarberServiceDataLoading()));

    final DataState dataState = await apiRepository.fetchBarberServicesData();

    if (dataState is DataSuccess) {
      // emit completed
      emit(
          state.copyWith(newDataStatus: BarberServiceDataCompleted(dataState.data)));
    }

    if (dataState is DataFailed) {
      // emit error
      emit(state.copyWith(newDataStatus: BarberServiceDataError(dataState.error!)));
    }
  }
}
