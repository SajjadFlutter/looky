import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/cubit/change_index_cubit/cubit/change_index_cubit.dart';
import 'presentation/home/view/page.dart';

class LookyApp extends StatelessWidget {
  const LookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeIndexCubit(),
      child: const MaterialApp(
        title: 'Looky',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
