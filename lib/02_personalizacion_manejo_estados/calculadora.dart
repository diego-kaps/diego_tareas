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

// Gracias al snippet StatefulW usamos estados dinámicos que únicamente recargan los cambios y no toda la aplicación en cada reload.

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double _resultado = 0.0;

  void _sumar() {
    double num1 =
        double.tryParse(_num1Controller.text) ??
        0.0; // Intentamos convertir el valor. En caso de que no exista, sera 0 por defecto.
    double num2 =
        double.tryParse(_num2Controller.text) ??
        0.0; // Lo mismo con el segundo número.
    setState(() {
      _resultado = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Calculadora Simple"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Número 1"),
              onChanged: (valor) => _sumar(),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Número 2"),
              onChanged: (valor) => _sumar(),
            ),

            const SizedBox(height: 20),

            Text(
              "Resultado: $_resultado",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
