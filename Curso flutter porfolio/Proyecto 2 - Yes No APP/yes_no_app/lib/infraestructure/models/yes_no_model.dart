// el modal sirve para crear un objeto que se va a utilizar en varios lugares de la app
/*class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'],
      forced: json['forced'],
      image: json['image'],
    );
  }
}
*/
// To parse this JSON data, do
//Desde aca realice el mapeado de la api https://app.quicktype.io/
//     final yesNoModel = yesNoModelFromMap(jsonString);
/*
import 'dart:convert';

YesNoModel yesNoModelFromMap(String str) => YesNoModel.fromMap(json.decode(str));
*/
//String yesNoModelToMap(YesNoModel data) => json.encode(data.toMap());
//String yesNoModelToMap(YesNoModel data) => json.encode(data.toMap());

import '../../domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessageEntity() => Message(
        //mappers es un metodo que nos permite mapear los datos que recibimos de la api ademas le paso un valor a la variable fromWho
        text: answer == 'yes' ? 'Si, Mortal' : 'No, anda con Zeus',
        fromWho: FromWho.other,
        imageUrl: image,
      );
}
