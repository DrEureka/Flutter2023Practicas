import 'package:flutter/material.dart';

//Este dart es el que se shows la screen principal de la app
class CounterScreen extends StatefulWidget {
//statefulwidget es un widget que tiene estado permite que el widget se redibuje
//en cambio un statelesswidget no tiene estado y no se redibuja

//aca puedo declarar variables globales dentro de este widget
  //final int clickCounter = 0;

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centra el contenido
          children: const [
            Text(
              '10',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Clicks',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
