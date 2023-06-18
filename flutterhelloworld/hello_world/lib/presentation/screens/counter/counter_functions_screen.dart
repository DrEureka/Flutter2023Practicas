import 'package:flutter/material.dart';

//Este dart es el que se shows la screen principal de la app

//Para renombrar las clases y archivos en vscode se puede hacer con F2
class CounterFunctionsScreen extends StatefulWidget {
//statefulwidget es un widget que tiene estado permite que el widget se redibuje
//en cambio un statelesswidget no tiene estado y no se redibuja

//aca puedo declarar variables globales dentro de este widget
  //final int clickCounter = 0;

  const CounterFunctionsScreen({super.key});

//creacion del estado
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

//llama al estado _CounterScreenState
class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  //aca puedo declarar variable para este estado
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions Screen'),
          //leading es el icono que va a la izquierda del titulo
          /*  leading: IconButton(
          icon: const Icon(Icons
              .refresh_rounded) //puede ir cualquier widget verificar siempre el requerimiento
          ,
          onPressed: () {},
        ),*/
          //actions es el icono que va a la derecha del titulo puedo colocar varios
          actions: [
            IconButton(
              icon: const Icon(Icons
                  .refresh_rounded) //puede ir cualquier widget verificar siempre el requerimiento
              ,
              onPressed: () {
                //aplico setstate para redibujar la pantalla y pasarle la variable a 0
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            /*  IconButton(
            icon: const Icon(Icons
                .read_more) //puede ir cualquier widget verificar siempre el requerimiento
            ,
            onPressed: () {},
          ),*/
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //centra el contenido
            children: [
              Text(
                //Declaro la variable que quiero mostrar y esta inicializada en 0 dentro de _CounterScreenState
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              //puedo hacer un if ternario para mostrar un texto u otro, en flutter solo esta la opcion de if! no hay else o elseif
              /*  if (clickCounter == 1)
              const Text(
                'Click',
                style: TextStyle(fontSize: 25),
              ),
            if (clickCounter != 1)
              const Text(
                'Clicks',
                style: TextStyle(fontSize: 25),
              ), */
              Text(
                // cuando clickCounter es 1 muestra Click sino muestra Clicks y la funcion que utiliza es  Acceso a propiedades opcionales
                // click es la palabra y si esta el simbolo de $ quiere decir que va a recibir algo en ese lugar, en el codigo
                // tenemos clickcounter == 1 y un '?' de pregunta quiere decir que puede ser vacio o la 's' dependiendo del valor.
                'Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        floatingActionButton:
            //Creo una columna para que el boton quede abajo a la derecha
            Column(
          // mainAxisAlignment para que el boton quede abajo a la derecha
          mainAxisAlignment: MainAxisAlignment.end,
          //children es un array de widgets, por ese motivo me permite agregar mas de un widget
          children: [
            /*   FloatingActionButton(
              //Shape permite darle forma al boton
              shape: const StadiumBorder(),
              onPressed: () {
                // aca la variable es 0
                setState(
                    () {}); // setState re dibuja la pantalla con los valores de
                clickCounter = 0;
              },
              child: const Icon(Icons.refresh_outlined),
            ),*/
            //sizedbox permite la separacion entre los botones
            CustomButton(
                icon: Icons.refresh_outlined,
                onPressed: () {
                  // aca la variable es 0
                  setState(
                      () {}); // setState re dibuja la pantalla con los valores de
                  clickCounter = 0;
                }),
            const SizedBox(
              height: 10,
            ),
            /*  FloatingActionButton(
              //Shape permite darle forma al boton
              shape: const StadiumBorder(),
              onPressed: () {
                // aca le sumo uno a la variable clickCounter
                setState(
                    () {}); // setState re dibuja la pantalla con los valores de
                clickCounter++;
              },
              child: const Icon(Icons.plus_one),
            ),*/
            CustomButton(
                icon: Icons.plus_one,
                onPressed: () {
                  // aca la variable es 0
                  setState(
                      () {}); // setState re dibuja la pantalla con los valores de
                  clickCounter++;
                }),
            //sizedbox permite la separacion entre los botones
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                icon: Icons.exposure_minus_1,
                onPressed: () {
                  // aca la variable es 0
                  setState(() {});
                  // setState re dibuja la pantalla con los valores de
                  //aca verifico que no sea menor a 0
                  if (clickCounter == 0) return;
                  clickCounter--;
                }),
          ],
        ));
  }
}

//ACA creo un widget personalizado para el boton asi no tengo que estar editando 3 botones o mas
class CustomButton extends StatelessWidget {
  //Le paso la propiedad icon de tipo IconData
  final IconData icon;
  final VoidCallback? onPressed;
  // cuando tengo un signo de pregunta es opcional '?' lo que reciba

  const CustomButton({
    //cuales parametros va a recibir  y son requeridos
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //Shape permite darle forma al boton
      //shape: const StadiumBorder(),
      //enableFeedback: true, //permite que el boton haga una animacion cuando se presiona
      enableFeedback: true,
      //Permite el manejo de sombras elevation
      elevation: 5,
      //Permite cambiar el color del fondo del boton
      backgroundColor: Colors.amber,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
