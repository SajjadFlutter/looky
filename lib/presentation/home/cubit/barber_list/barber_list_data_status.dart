part of 'barber_list_cubit.dart';

@immutable
abstract class BarberListDataStatus {}

class BarberListDataLoading extends BarberListDataStatus {}

class BarberListDataCompleted extends BarberListDataStatus {
  final BarberListModel barberListModel;

  BarberListDataCompleted(this.barberListModel);
}

class BarberListDataError extends BarberListDataStatus {
  final String errorMessage;

  BarberListDataError(this.errorMessage);
}
