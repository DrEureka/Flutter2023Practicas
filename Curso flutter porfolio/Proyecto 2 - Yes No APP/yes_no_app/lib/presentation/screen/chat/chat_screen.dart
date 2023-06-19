import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

import '../../../providers/chat_provider.dart';
import '../../widgets/chat/other_message_bubble.dart';
import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //creo un leading para el avatar y le doy padding
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          //permito agregar un formato de avatar y agrego una URL para levantaar la imagen
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://fortnite-api.com/images/cosmetics/br/cid_964_athena_commando_m_historian_869bc/featured.png'),
          ),
        ),
        title: const Text('Kratos Responde'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //se crea una variable para poder acceder al provider y que este pendiente de los cambios
    final chatProvider = context.watch<ChatProvider>();

    //creo un SafeArea para que no se superponga con la barra de notificaciones con un warp widget
    return SafeArea(
      left: false,
      right: false,
      // le agregue un padding al column por warp padding
      child: Padding(
        //le agregue unos bordes al padding symetric
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //creo un expanded para que el listview ocupe todo el espacio disponible
            Expanded(
                child: ListView.builder(
              //le paso el provider para que sepa cuantos elementos tiene que renderizar
              itemCount: chatProvider.messageList.length,
              // itembuilder es como va renderizar cada elemento
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.other)
                    ? OtherMessageBubble()
                    : MyMessageBubble(message: message);

                /*   return (index % 2 == 0)
                    //'?' const OtherMessageBubble()
                    : const MyMessageBubble();
                    */
              },
            )),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
