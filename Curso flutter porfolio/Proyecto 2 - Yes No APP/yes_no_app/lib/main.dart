import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';
import 'package:yes_no_app/presentation/screen/chat/chat_screen.dart';
import 'package:yes_no_app/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Aca le paso el provider y le digo que sea multiprovider para que pueda tener varios providers, ademas como tengo un provider
    //ya creado necesita que le pase un create: (_) => ChatProvider() para que pueda funcionar...
    //el (_) es un parametro que no se usa, pero es necesario para que funcione
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        //Saco la barra de debug
        debugShowCheckedModeBanner: false,
        //Aca le paso el tema personalizado
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
