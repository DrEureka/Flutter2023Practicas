import 'package:flutter/material.dart';
import 'package:hello_world/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // screen principal de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          useMaterial3: true, //ultimo tipo de material para flutter3
          colorSchemeSeed: Colors.blue,
        ),
        home: const CounterScreen());
  }
}
