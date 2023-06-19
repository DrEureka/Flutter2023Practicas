import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    //creo un textcontroller para poder limpiar el campo de texto
    final textController = TextEditingController();
    //focusNode es para que el campo de texto se enfoque en el momento que se renderiza
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      //TODO a chequear el mensaje de pregunta
      hintText: 'Escribe la pregunta...',
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('Send: $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      //para que no se superponga con el teclado
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      //decoration es para darle formato al campo de texto
      decoration: inputDecoration,
      //para que se envie el mensaje cuando se presione enter
      onFieldSubmitted: (value) {
        print('ENTER: $value');
        //limpio el campo de texto
        textController.clear();
        focusNode.requestFocus();
      },
      /*  onChanged: (value) {
        print('Input:$value');
      },*/
    );
  }
}
