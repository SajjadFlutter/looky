import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:looky/injections.dart';
import 'package:looky/looky_app.dart';

void main() async {
  await ensureInitializedApp();

  runApp(const LookyApp());
}

Future<void> ensureInitializedApp() async {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  WidgetsFlutterBinding.ensureInitialized();
  await ensureInitialized();
}
