import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_respuesta.dart';

import '../domain/entities/message.dart';

//que es un provider? es una clase que nos permite compartir informacion entre widgets
//ademas de ser un gestor de estados!
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoRespuesta getYesNoAnswer = GetYesNoRespuesta();
  //changenotifyer es un objeto que nos permite notificar a los widgets que estan escuchando
  List<Message> messageList = [
    // Message(text: 'hola kratos', fromWho: FromWho.me),
    // Message(text: 'como va?', fromWho: FromWho.me),
    //Message(text: 'como va?', fromWho: FromWho.other),
  ];
//future es un tipo de dato que nos permite trabajar con asincronismo, void? es un tipo de dato que puede ser nulo
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    //creo un nuevo mensaje con el texto que recibo por parametro y lo muestro por pantalla
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    //TODO: implementar el envio de mensajes
    if (text.endsWith('?')) {
      await otherReply();
    }
    //notifyListeners es un metodo que nos permite notificar a los widgets que estan escuchando para que entiendan que hubo un cambio...
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    //delayed es un metodo que nos permite hacer un delay de la animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //maxScrollExtent es el maximo scroll que se puede hacer en el listview
      chatScrollController.position.maxScrollExtent,
      //duration es la duracion de la animacion que en este caso es de 300 milisegundos
      duration: const Duration(milliseconds: 300),
      //curve es la curva de la animacion que en este caso es una curva de salida
      curve: Curves.easeOut,
    );
  }
}
