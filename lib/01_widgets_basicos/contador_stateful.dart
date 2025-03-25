import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}
// Se han creado una variable y método privado para respetar la encapsulación (POO).
class _ContadorState extends State<Contador> {
  int _counter = 0;

  void _incrementarContador() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Contador Simple"))),
        body: Center(
          child: Column(
            // Para que estén los elementos en el centro.
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contador: $_counter",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementarContador,
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 40, // Le aumentamos el tamaño para que sea el foco de la pantalla.
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Si ponemos centerDocked se queda anclado a la barra de navegación.
      ),
    );
  }
}
