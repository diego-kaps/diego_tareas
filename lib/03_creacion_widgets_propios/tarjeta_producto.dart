// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProductoApp());
}

// Clase principal de la aplicación.
class ProductoApp extends StatelessWidget {
  const ProductoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const PantallaProducto(),
    );
  }
}

// Pantalla que muestra una lista de productos.
class PantallaProducto extends StatefulWidget {
  const PantallaProducto({super.key});

  @override
  State<PantallaProducto> createState() => _PantallaProductoState();
}

class _PantallaProductoState extends State<PantallaProducto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Productos",
            // Aplicamos la fuente Roboto al título del AppBar.
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade200,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: const [
            // Lista de tarjetas de productos.
            TarjetaProducto(
              titulo: "Zapatillas de Lona",
              imageUrl:
                  "https://zapatop.com/8951-large_default/mujer-zapatillas-zapatillas-de-lona-modelo-7-a12d_14-25.jpg",
              precio: 10.95,
            ),
            TarjetaProducto(
              titulo: "Nike Revolution 7",
              imageUrl:
                  "https://resize.sprintercdn.com/f/384x384/products/0371390/nike-revolution-7_0371390_02_4_2983334563.jpg?w=384&q=75",
              precio: 15.99,
            ),
            TarjetaProducto(
              titulo: "Adidas Climacool 1 Sneaker",
              imageUrl:
                  "https://asset.snipes.com/images/f_auto,q_100,d_fallback-sni.png/b_rgb:f8f8f8,c_pad,w_680,h_680/dpr_1.0/02303297_1/adidas-originals-climacool-1-sneaker-negro-29350-1",
              precio: 125.99,
            ),
            TarjetaProducto(
              titulo: "Puma Park Lifestyle",
              imageUrl:
                  "https://img01.ztat.net/article/spp-media-p1/06deb88e351c4975af05a0aa84ea2b42/5cc2e7a2a37e4e10ba232de558354cab.jpg?imwidth=1800&filter=packshot",
              precio: 79.95,
            ),
            TarjetaProducto(
              titulo: "Nike Air Force 1'07",
              imageUrl:
                  "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/82aa97ed-98bf-4b6f-9d0b-31a9f907077b/AIR+FORCE+1+%2707.png",
              precio: 119.95,
            ),
          ],
        ),
      ),
    );
  }
}

// Clase que representa una tarjeta de producto.
class TarjetaProducto extends StatefulWidget {
  final String titulo;
  final String imageUrl;
  final double precio;

  const TarjetaProducto({
    super.key,
    required this.titulo,
    required this.imageUrl,
    required this.precio,
  });

  @override
  State<TarjetaProducto> createState() => _TarjetaProductoState();
}

class _TarjetaProductoState extends State<TarjetaProducto> {
  // Lista de colores disponibles para selección.
  final List<Color> colores = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  // Color seleccionado inicialmente.
  Color _colorElegido = Colors.red;

  // Método para actualizar el color seleccionado.
  void _setColor(Color color) {
    setState(() {
      _colorElegido = color;
    });
  }

  // Método para mostrar un modal con los colores disponibles.
  void _showSelectorColor() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const Text(
                "Selecciona un color",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: colores.length,
                  itemBuilder: (context, indice) {
                    return GestureDetector(
                      onTap: () {
                        _setColor(colores[indice]);
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(backgroundColor: colores[indice]),
                    );
                  },
                ),
              ),
              Text(
                "Color Actual: ${_getNombreColor(_colorElegido)}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Método para obtener el nombre del color seleccionado.
  String _getNombreColor(Color color) {
    return {
          Colors.red: "Rojo",
          Colors.blue: "Azul",
          Colors.green: "Verde",
          Colors.orange: "Naranja",
          Colors.purple: "Morado",
        }[color] ??
        "Desconocido";
  }

  // Método para formatear el precio en euros.
  String formatPrecioEnEuros(double precio) {
    return NumberFormat.currency(locale: "es_ES", symbol: "€").format(precio);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          widget.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          formatPrecioEnEuros(widget.precio),
          style: const TextStyle(fontSize: 18),
        ),
        trailing: GestureDetector(
          onTap: _showSelectorColor,
          child: CircleAvatar(backgroundColor: _colorElegido, radius: 20),
        ),
      ),
    );
  }
}
