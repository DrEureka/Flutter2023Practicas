import 'package:dio/dio.dart';

import '../../domain/entities/message.dart';
import '../../infraestructure/models/yes_no_model.dart';

class GetYesNoRespuesta {
  //creo la instancia de dio
  final _dio = Dio();
  Future<Message> getAnswer() async {
    //creo una variable que va a ser igual a la respuesta que me da la api
    final response = await _dio.get('https://yesno.wtf/api');
    //creo una variable que va a ser igual a la respuesta que me da la api
    // response.data['answer'];

    final yesNoModel = YesNoModel.fromMap(response.data);
    //creo un metodo para mapear los datos que recibo de la api
    return yesNoModel.toMessageEntity();
    /* return Message(
      //mappers es un metodo que nos permite mapear los datos que recibimos de la api
      text: yesNoModel.answer,
      fromWho: FromWho.other,
      imageUrl: yesNoModel.image,
    );*/
  }
}
