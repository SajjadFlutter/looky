import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/domain/logic/api_repository.dart';
import 'package:looky/injections.dart';

import 'common/cubit/change_index_cubit/cubit/change_index_cubit.dart';
import 'presentation/home/cubit/barber_service/barber_service_cubit.dart';
import 'presentation/home/cubit/show_filter_cubit/show_filter_cubit.dart';
import 'presentation/home/view/page.dart';

class LookyApp extends StatelessWidget {
  const LookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeIndexCubit()),
        BlocProvider(create: (context) => ShowFilterCubit()),
        BlocProvider(create: (context) => BarberServiceCubit(serviceLocator<ApiRepository>())),
      ],
      child: const MaterialApp(
        title: 'Looky',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
