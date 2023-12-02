import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:looky/common/cubit/change_index_cubit/cubit/change_index_cubit.dart';
import 'package:looky/domain/logic/api_repository.dart';
import 'package:looky/infrastructure/provider/api_provider.dart';
import 'package:looky/presentation/home/cubit/show_filter_cubit/show_filter_cubit.dart';

import 'presentation/home/cubit/barber_service/barber_service_cubit.dart';

GetIt serviceLocator = GetIt.I;

Future<void> ensureInitialized() async {
  _ensureInitializedCommon();
  _ensureInitializedServices();
  _ensureInitializedRepositories();
  _ensureInitializedProviders();
  _ensureInitializedCubits();
}

void _ensureInitializedProviders() {
  serviceLocator
      .registerLazySingleton(() => ApiProvider(dio: serviceLocator()));
}

void _ensureInitializedCubits() {
  serviceLocator.registerLazySingleton(() => ChangeIndexCubit());
  serviceLocator.registerLazySingleton(() => ShowFilterCubit());
  serviceLocator.registerLazySingleton(() => BarberServiceCubit(serviceLocator()));
}

void _ensureInitializedServices() {}

void _ensureInitializedRepositories() {
  serviceLocator.registerLazySingleton(() => ApiRepository(serviceLocator()));
}

void _ensureInitializedCommon() {
  serviceLocator.registerLazySingleton(() => Dio());
}
