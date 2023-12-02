part of 'barber_service_cubit.dart';

class BarberServiceState {
  final BarberServiceDataStatus dataStatus;

  BarberServiceState({required this.dataStatus});

  BarberServiceState copyWith(
      {required BarberServiceDataStatus? newDataStatus}) {
    return BarberServiceState(dataStatus: newDataStatus ?? dataStatus);
  }
}
