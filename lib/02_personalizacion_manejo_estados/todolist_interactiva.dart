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

    // Eliminamos el contenido de los campos de texto para que el usuario pueda seguir añadiendo tareas.
    _tituloController.clear();
    _descController.clear();
  }

  // Elimina una tarea que esté añadida a la lista.
  void _removerTarea(int indice) {
    setState(() {
      _tareas.removeAt(indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("App To-Do", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1.2, color: Colors.white),)),
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
            // Esta es la lista de tareas que se genera dinámicamente.
            Expanded(
              child: ListView.builder(
                itemCount: _tareas.length,
                itemBuilder: (contexto, indice) {
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
                      title: Text(
                        _tareas[indice]["titulo"]!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_tareas[indice]["desc"]!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removerTarea(indice),
                      )
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
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
