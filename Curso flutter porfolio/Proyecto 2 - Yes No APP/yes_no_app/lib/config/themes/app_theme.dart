import 'package:flutter/material.dart';

//tambien puedo pasarlo por RGB
const Color _customColor = Color.fromARGB(255, 69, 236, 27);
//Armo una lista de const de colores para el tema
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.white,
  Colors.tealAccent,
];

//creo una class nueva llamada AppTheme para pasarle los parametros globales del theme
class AppTheme {
  //creo un final int para el color seleccionado
  final int selectedColor;

//constructor de la class para que pida el color seleccionado
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'selectedColor tiene que estar dentro de 0 y ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      // le paso el final del color seleccionado
      colorSchemeSeed: _colorThemes[selectedColor],
      //fondo negro, tambien puedo crearlo como un requerimiento y lo paso como variable.
      //brightness: Brightness.dark,
    );
  }
}
