import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

// Clase con StatefulWidget porque el contador cambia su estado.
class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

// Se han creado una variable y método privado para respetar el principio de encapsulación (POO).
class _ContadorState extends State<Contador> {
  int _counter = 0;

  void _incrementarContador() {
    setState(() {
      // Hace que cambie el estado y aumenta el contador, cambiando cada vez que ocurre.
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
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            crossAxisAlignment:
                CrossAxisAlignment
                    .center, // Y asegura la alineación horizontal.
            children: [
              Text(
                "Contador: $_counter", // Muestra el contador con un estilo más grande.
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
            size:
                40, // Le aumentamos el tamaño para que sea el foco de la pantalla.
          ),
        ),
        // Le ponemos una localización para mejorar accesibilidad y visibilidad.
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .centerFloat, // Si usas "centerDocked" se queda anclado a la barra de navegación.
      ),
    );
  }
}
