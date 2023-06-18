import 'package:flutter/material.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      //Saco la barra de debug
      debugShowCheckedModeBanner: false,
      //Aca le paso el tema personalizado
      theme: AppTheme(selectedColor: 8).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child:
              FilledButton.tonal(onPressed: () {}, child: const Text('Click')),
        ),
      ),
    );
  }
}
