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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: "Roboto", fontSize: 16),
          bodyMedium: TextStyle(fontFamily: "Roboto", fontSize: 14),
          bodySmall: TextStyle(fontFamily: "Roboto", fontSize: 12),
        ),
      ),
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
  // Lista que almacena las tareas como si de un listado de mapas dinámicos se tratase.
  // Facilita luego la búsqueda de las tareas gracias al key - value de los mapas.
  final List<Map<String, String>> _tareas = []; // Lo dejamos instanciado.

  // Controladores que se utizarán para obtener el nombre y descripción introducidos.
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Agrega una nueva tarea con su título y descripción.
  void _addTarea() {
    if (_tituloController.text.isEmpty || _descController.text.isEmpty) return;
    setState(() {
      _tareas.add({
        "titulo": _tituloController.text,
        "desc": _descController.text,
      });
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("¡Tarea añadida con éxito!")));
    // Eliminamos el contenido de los campos de texto para que el usuario pueda seguir añadiendo tareas.
    _tituloController.clear();
    _descController.clear();
  }

  // Elimina una tarea que esté añadida a la lista.
  void _removerTarea(int indice) {
    setState(() {
      _tareas.removeAt(indice);
    });

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
                  TextField(
                    controller: _tituloController,
                    decoration: const InputDecoration(labelText: "Titulo"),
                  ),
                  TextField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: "Descripción"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Usamos Expanded para que ocupe el resto de espacio de la columna.
            Expanded(
            // Esta es la lista de tareas que se genera dinámicamente.
              child: ListView.builder( 
                itemCount: _tareas.length,
                itemBuilder: (contexto, indice) {
                  // Estructura de la carta en la que se añadirá cada tarea.
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Estructura de cada elemento que se añada a la lista.
                    child: ListTile(
                      title: Text(
                        _tareas[indice]["titulo"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      subtitle: Text(_tareas[indice]["desc"]!, style: TextStyle(
                        fontSize: 14,
                      ),),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addTarea,
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add),
      ),
    );
  }
}
