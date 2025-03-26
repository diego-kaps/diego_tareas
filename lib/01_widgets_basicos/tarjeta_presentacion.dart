import 'package:flutter/material.dart';

void main() {
  runApp(const TarjetaPresentacion());
}

// Widget sin estado porque su contenido no cambia durante la ejecución.
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
          // Restringe el tamaño de la tarjeta.
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 280,
              maxWidth: 340,
              minHeight: 180,
              maxHeight: 240,
            ),
            // Fondo con degradado y bordes redondeados.
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              // Tarjeta con sombra y bordes redondeados.
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Solo ocupa el espacio necesario.
                    children: [
                      // Contenedor con borde azul para la imagen.
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue.shade400,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/imagen_perfil.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ), // Espacio entre la imagen y el texto.
                      // Información de la tarjeta.
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          ), // Espacio entre el nombre y la descripción.
                          // Contenedor para evitar desbordamiento de texto.
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Minim deserunt incididunt Lorem nulla. Excepteur nulla velit aliquip veniam est elit.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              softWrap:
                                  true, // Permite dividir el texto en varias líneas.
                              overflow:
                                  TextOverflow
                                      .visible, // Asegura que todo el texto sea visible.
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
