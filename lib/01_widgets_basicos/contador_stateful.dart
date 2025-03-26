import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

// StatefulWidget porque el contador cambia su valor dinámicamente al presionar el botón.
class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

// Clase que maneja el estado del contador.
class _ContadorState extends State<Contador> {
  // Variable privada que almacena el valor actual del contador.
  int _counter = 0;

  // Método para incrementar el valor del contador y actualizar la interfaz.
  void _incrementarContador() {
    setState(() {
      // Aumenta el contador y notifica a Flutter para que reconstruya la UI.
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
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente.
            crossAxisAlignment:
                CrossAxisAlignment
                    .center, // Asegura que los elementos estén alineados en el centro horizontal.
            children: [
              Text(
                "Contador: $_counter", // Muestra el valor actual del contador.
                style: const TextStyle(
                  fontSize: 40, // Tamaño de fuente grande para el contador.
                  fontWeight: FontWeight.bold, // Texto en negrita.
                  color: Colors.blue, // Color del texto.
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
              _incrementarContador, // Llama al método para incrementar el contador.
          backgroundColor: Colors.blue, // Color de fondo del botón.
          child: const Icon(
            Icons.add, // Icono de sumar.
            size: 40, // Tamaño grande para que el botón sea más visible.
          ),
        ),
        // Ubicación del botón flotante en el centro de la pantalla.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
