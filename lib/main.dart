import 'package:dokan/splash_Screen.dart';
import 'package:dokan/test.dart';
import 'package:dokan/ui/sing_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dokan',
      home:  SplashScreenPage(),
    );
  }
}


