// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // Lista que almacena las tareas, representadas como mapas con clave "titulo" y "desc".
  final List<Map<String, String>> _tareas = [];

  // Controladores para capturar el texto ingresado en los campos de entrada.
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Método para agregar una nueva tarea con título y descripción.
  void _addTarea() {
    if (_tituloController.text.isEmpty || _descController.text.isEmpty) return;

    setState(() {
      _tareas.add({
        "titulo": _tituloController.text,
        "desc": _descController.text,
      });
    });

    // Muestra un mensaje de confirmación.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("¡Tarea añadida con éxito!")));

    // Limpia los campos de entrada después de agregar la tarea.
    _tituloController.clear();
    _descController.clear();
  }

  // Método para eliminar una tarea de la lista según su índice.
  void _removerTarea(int indice) {
    setState(() {
      _tareas.removeAt(indice);
    });

    // Muestra un mensaje de confirmación al eliminar la tarea.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("¡Tarea eliminada!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "App To-Do",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contenedor estilizado para los campos de entrada.
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Campo de entrada para el título de la tarea.
                  TextField(
                    controller: _tituloController,
                    decoration: const InputDecoration(labelText: "Título"),
                  ),
                  // Campo de entrada para la descripción de la tarea.
                  TextField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: "Descripción"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Lista dinámica de tareas.
            Expanded(
              child: ListView.builder(
                itemCount: _tareas.length,
                itemBuilder: (context, indice) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      // Muestra el título de la tarea.
                      title: Text(
                        _tareas[indice]["titulo"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      // Muestra la descripción de la tarea.
                      subtitle: Text(
                        _tareas[indice]["desc"]!,
                        style: TextStyle(fontSize: 14),
                      ),
                      // Botón para eliminar la tarea.
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removerTarea(indice),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Botón flotante para agregar nuevas tareas.
      floatingActionButton: FloatingActionButton(
        onPressed: _addTarea,
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add),
      ),
    );
  }
}
