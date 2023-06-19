import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class OtherMessageBubble extends StatelessWidget {
  const OtherMessageBubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      //Formato de la columna para que se alinee a la derecha
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                //  'Yo solo soy lo que los dioses me hicieron ser. mi respuesta es: message.text',
                message.text,
                style: const TextStyle(color: Colors.white)),
          ),
        ),
        //le agrego un espacio entre los mensajes
        const SizedBox(height: 5),
//Llamo a la imagen de la columna

        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    // size de mediaquery para que se adapte a cualquier tamaño de pantalla
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        //TODO: Sacar la URL DE CORS ANYWHERE...
        //https://cors-anywhere.herokuapp.com/ para que me permita levantar la imagen desde dev.
        // 'https://cors-anywhere.herokuapp.com/https://yesno.wtf/assets/yes/7-653c8ee5d3a6bbafd759142c9c18d76c.gif',
        'https://cors-anywhere.herokuapp.com/$imageUrl',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        //propiedad loadingbuilder para que se muestre la imagen mientras carga
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return (child);
          // PUEDO TENER ELSE IF ESTE ES EL FORMATO: else if (loadingProgress == true) {
          // return (child);
          // }

          return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Kratos esta enviando una imagen...',
                  style: TextStyle(color: Colors.blue)));
        },
      ),
    );
  }
}
