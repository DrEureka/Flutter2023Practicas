import 'package:flutter/material.dart';

import '../domain/entities/message.dart';

//que es un provider? es una clase que nos permite compartir informacion entre widgets
//ademas de ser un gestor de estados!
class ChatProvider extends ChangeNotifier {
  //changenotifyer es un objeto que nos permite notificar a los widgets que estan escuchando
  List<Message> message = [
    Message(text: 'hola kratos', fromWho: FromWho.me),
    Message(text: 'como va?', fromWho: FromWho.me),
  ];
//future es un tipo de dato que nos permite trabajar con asincronismo, void? es un tipo de dato que puede ser nulo
  Future<void> sendMessage(String text) async {
    //TODO: implementar el envio de mensajes
  }
}
