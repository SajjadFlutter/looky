part of 'barber_service_cubit.dart';

@immutable
abstract class BarberServiceDataStatus {}

class BarberServiceDataLoading extends BarberServiceDataStatus {}

class BarberServiceDataCompleted extends BarberServiceDataStatus {
  final BarberServiceModel barberServiceModel;

  BarberServiceDataCompleted(this.barberServiceModel);
}

class BarberServiceDataError extends BarberServiceDataStatus {
  final String errorMessage;

  BarberServiceDataError(this.errorMessage);
}
