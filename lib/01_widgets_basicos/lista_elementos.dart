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
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              // Modificamos las propiedades para que todo quede mejor.
              margin: const EdgeInsets.all(
                8.0,
              ), // Margen entre los elementos de la tarjeta.
              elevation: 3,
              child: ListTile(
                // Utilizado para cada entrada en la lista.
                leading: ClipRRect(
                  // Se usa este tipo de recorte porque permite bordes redondeados.
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://picsum.photos/seed/${index + 1}/200/200", // Se le suma 1 porque la seed inicial daban repetidas 2 imágenes.
                    width: 60,
                    height: 60,
                    fit:
                        BoxFit
                            .cover, // Para que la imagen insertada se ajuste bien.
                  ),
                ),
                title: Text("Elemento ${index + 1}"),
                subtitle: const Text("Descripción usada como ejemplo."),
              ),
            );
          },
        ),
      ),
    );
  }
}
