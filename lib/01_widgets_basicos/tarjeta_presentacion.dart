import 'package:flutter/material.dart';

void main() {
  runApp(const TarjetaPresentacion());
}

class TarjetaPresentacion extends StatelessWidget {
  const TarjetaPresentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),

      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Tarjeta de Presentación")),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              // Ancho y Altura de la tarjeta.
              minWidth: 280,
              maxWidth: 340,
              minHeight: 180,
              maxHeight: 240,
            ),
            child: Container(
              // Queremos un degradado de tipo cuadrado,.
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Establecemos los colores, inicio y fin del degradado.
                  colors: [Colors.blue.shade100, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  // Rectángulo con bordes redondeados.
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  // Separación entre los bordes y los elementos.
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    // Fila para la estructura de la tarjeta.
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        // Recorte en forma de círculo.
                        child: Image.asset(
                          'assets/images/imagen_perfil.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ), // Insertamos un espacio entre la imagen y el texto.
                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Cross Axis es el vertical porque estamos en una columna.
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Lucas Martínez",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ), // Espacio entre el nombre y descripción.
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Minim deserunt incididunt Lorem nulla. Excepteur nulla velit aliquip veniam est elit.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
