import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const Calculadora(),
    );
  }
}

// Widget con estado para actualizar dinámicamente los resultados.
class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // Controladores para capturar los valores ingresados por el usuario.
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Variable que almacena el resultado de la suma.
  double _resultado = 0.0;

  // Método que realiza la suma y actualiza la pantalla en tiempo real.
  void _sumar() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0.0;

    setState(() {
      _resultado = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Calculadora Simple"))),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100, // Fondo gris claro.
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Margen general.
          child: Column(
            children: [
              // Tarjeta para contener los campos de entrada.
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Campo para ingresar el primer número.
                      TextField(
                        controller: _num1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Número 1",
                        ),
                        onChanged:
                            (valor) =>
                                _sumar(), // Actualiza el resultado al escribir.
                      ),
                      const SizedBox(height: 10),
                      // Campo para ingresar el segundo número.
                      TextField(
                        controller: _num2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Número 2",
                        ),
                        onChanged: (valor) => _sumar(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20), // Espacio entre los elementos.
              // Tarjeta que muestra el resultado.
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Resultado: $_resultado",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
