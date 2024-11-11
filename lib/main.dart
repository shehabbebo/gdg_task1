import 'package:flutter/material.dart';
import 'package:task1/log_in.dart';
import 'package:task1/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginPage': (context) => const LoginPage(),
        Regester.id: (context) => Regester(),
      },
      initialRoute: 'LoginPage',
      debugShowCheckedModeBanner: false,
    );
  }
}
