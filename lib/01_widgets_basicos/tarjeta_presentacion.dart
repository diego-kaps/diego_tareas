import 'package:flutter/material.dart';

void main() {
  runApp(const TarjetaPresentacion());
}

// Es sin estado porque no cambia durante la ejecución.
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
          // Lo usamos para restringir el tamaño de la tarjeta.
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              // Ancho y Altura de la tarjeta.
              minWidth: 280,
              maxWidth: 340,
              minHeight: 180,
              maxHeight: 240,
            ),
            // Envolvemos la tarjeta con un fondo degradado con bordes redondeados.
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
              // Tarjeta con efecto sombra gracias a la elevación y bordes redondeados.
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  // Rectángulo con bordes redondeados.
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  // Separación entre los bordes y los elementos.
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    // Fila para la estructura de la tarjeta.
                    mainAxisSize:
                        MainAxisSize
                            .min, // Solo ocupa el tamaño necesario, no estira la fila.
                    children: [
                      // Contenedor para darle un borde azul sutil a la imagen.
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue.shade400,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          // Recorte en forma de círculo.
                          child: Image.asset(
                            'assets/images/imagen_perfil.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width:
                            18, // Insertamos un espacio entre la imagen y el texto.
                      ),
                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Cross Axis es el vertical porque estamos en una columna.
                        mainAxisSize:
                            MainAxisSize
                                .min, // Lo mismo con la columna, para que no se estire.
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
                          // Se ha usado otra SizedBox para evitar que la descripción se desborde y que este tenga limitaciones.
                          SizedBox(
                            width: 200,
                            child: Text(
                              // Se ha usado Lorem Ipsum para probar como se ven texto más largos en la IU.
                              "Minim deserunt incididunt Lorem nulla. Excepteur nulla velit aliquip veniam est elit.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              softWrap:
                                  true, // El texto se divide en varias lineas si fuera necesario.
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
