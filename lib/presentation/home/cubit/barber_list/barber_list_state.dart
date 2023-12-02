part of 'barber_list_cubit.dart';

class BarberListState {
  final BarberListDataStatus dataStatus;

  BarberListState({required this.dataStatus});

  BarberListState copyWith(
      {required BarberListDataStatus? newDataStatus}) {
    return BarberListState(dataStatus: newDataStatus ?? dataStatus);
  }
}
