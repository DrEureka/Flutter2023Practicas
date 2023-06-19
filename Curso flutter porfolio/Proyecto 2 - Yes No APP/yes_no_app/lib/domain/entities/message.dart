//codigo dart para el archivo message.dart que pertiene creacion de mensajes en el chat
enum FromWho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
