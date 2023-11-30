import 'package:flutter/material.dart';

import 'presentation/home/view/page.dart';

class LookyApp extends StatelessWidget {
  const LookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Looky',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}