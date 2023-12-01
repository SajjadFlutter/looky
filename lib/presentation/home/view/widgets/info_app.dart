import 'package:flutter/material.dart';

class InfoApp extends StatelessWidget {
  const InfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/home/looky.png'),
        const Text(
          'LOOKY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 8.0,
          ),
        ),
        Text(
          'Fastest Way to Find Barbers',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
