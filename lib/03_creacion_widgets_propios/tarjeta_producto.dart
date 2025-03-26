// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProductoApp());
}

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
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
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
          children: [
            const TarjetaProducto(
              titulo: "Zapatillas de Lona",
              imageUrl:
                  "https://zapatop.com/8951-large_default/mujer-zapatillas-zapatillas-de-lona-modelo-7-a12d_14-25.jpg",
              precio: 10.95,
            ),
            const TarjetaProducto(
              titulo: "Nike Revolution 7",
              imageUrl:
                  "https://resize.sprintercdn.com/f/384x384/products/0371390/nike-revolution-7_0371390_02_4_2983334563.jpg?w=384&q=75",
              precio: 15.99,
            ),
            const TarjetaProducto(
              titulo: "Adidas Climacool 1 Sneaker",
              imageUrl:
                  "https://asset.snipes.com/images/f_auto,q_100,d_fallback-sni.png/b_rgb:f8f8f8,c_pad,w_680,h_680/dpr_1.0/02303297_1/adidas-originals-climacool-1-sneaker-negro-29350-1",
              precio: 125.99,
            ),
            const TarjetaProducto(
              titulo: "Puma Park Lifestyle",
              imageUrl:
                  "https://img01.ztat.net/article/spp-media-p1/06deb88e351c4975af05a0aa84ea2b42/5cc2e7a2a37e4e10ba232de558354cab.jpg?imwidth=1800&filter=packshot",
              precio: 79.95,
            ),
          ],
        ),
      ),
    );
  }
}

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
  // Lista de colores predefinidos para los productos.
  List<Color> colores = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  // Variable para almacenar el color que sea seleccionado.
  Color _colorElegido = Colors.red;
  // Necesitamos que haya uno de manera predeterminada.

  // Hacemos el método para que únicamente cambie el estado del color y no tenga que recargar toda la app.
  void _setColor(Color color) {
    setState(() {
      _colorElegido = color;
    });
  }

  // Metodo para mostrar un modal con los colores disponibles.
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
                    // Usamos esto para que las celdas tengan un número fijo de columnas.
                    crossAxisCount: 5, // Este es el número de columnas.
                    crossAxisSpacing:
                        10, // Espaciado horizontal de las columnas
                    mainAxisSpacing: 10, // Espaciado Vertical de las columnas.
                  ),
                  itemCount: colores.length,
                  itemBuilder: (context, indice) {
                    return GestureDetector(
                      onTap: () {
                        _setColor(colores[indice]);
                        Navigator.pop(context); // Cerramos el modal
                      },
                      child: CircleAvatar(backgroundColor: colores[indice]),
                    );
                  },
                ),
              ),
              Text(
                "Color Actual: ${_getNombreColor(_colorElegido)}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getNombreColor(Color color) {
    Map<Color, String> nombresColor = {
      Colors.red: "Rojo",
      Colors.blue: "Azul",
      Colors.green: "Verde",
      Colors.orange: "Naranja",
      Colors.purple: "Morado",
    };
    return nombresColor[color] ?? "Desconocido";
  }

  String formatPrecioEnEuros(double precio) {
    var formatoMoneda = NumberFormat.currency(locale: "es_ES", symbol: "€");
    return formatoMoneda.format(precio);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      shadowColor: Colors.black54,
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
          style: const TextStyle(fontSize: 15),
        ),
        trailing: GestureDetector(
          onTap: _showSelectorColor,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _colorElegido,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: Icon(Icons.check, color: Colors.white, size: 26),
          ),
        ),
      ),
    );
  }
}
