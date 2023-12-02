import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/common/resources/data_state.dart';
import 'package:looky/domain/logic/api_repository.dart';
import 'package:looky/infrastructure/model/barber_list_model.dart';

part 'barber_list_state.dart';
part 'barber_list_data_status.dart';

class BarberListCubit extends Cubit<BarberListState> {
  final ApiRepository apiRepository;
  BarberListCubit(this.apiRepository)
      : super(BarberListState(dataStatus: BarberListDataLoading()));

  Future<void> callBarberListDataEvent() async {
    // emit loading
    emit(state.copyWith(newDataStatus: BarberListDataLoading()));

    final DataState dataState = await apiRepository.fetchBarberListData();

    if (dataState is DataSuccess) {
      // emit completed
      emit(state.copyWith(
          newDataStatus: BarberListDataCompleted(dataState.data)));
    }

    if (dataState is DataFailed) {
      // emit error
      emit(
          state.copyWith(newDataStatus: BarberListDataError(dataState.error!)));
    }
  }
}
