import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/home_screen.dart';
import 'package:flutter_application_1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Univeristy Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      routerConfig: router,
    );
  }
}
