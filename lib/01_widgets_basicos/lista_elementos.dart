import 'package:flutter/material.dart';

void main() {
  runApp(const ListaElementos());
}

class ListaElementos extends StatelessWidget {
  const ListaElementos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Lista de Elementos"))),
        body: ListView.builder(
          // Definimos que la lista tendrá 10 elementos.
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              // Espacio alrededor de la tarjeta para separarla de otros elementos.
              margin: const EdgeInsets.all(8.0),
              elevation: 3, // Sombra para dar profundidad.
              child: ListTile(
                // Icono o imagen que aparece al principio de cada fila.
                leading: ClipRRect(
                  // Recorta las imágenes en forma circular.
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    // Genera una imagen aleatoria usando una URL dinámica.
                    "https://picsum.photos/seed/${index + 1}/200/200",
                    width: 60,
                    height: 60,
                    fit:
                        BoxFit
                            .cover, // Ajuste adecuado para que la imagen no se distorsione.
                  ),
                ),
                title: Text(
                  "Elemento ${index + 1}",
                ), // Título dinámico para cada fila.
                subtitle: const Text(
                  "Descripción usada como ejemplo.",
                ), // Descripción fija.
              ),
            );
          },
        ),
      ),
    );
  }
}
