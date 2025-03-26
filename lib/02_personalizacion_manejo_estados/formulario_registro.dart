import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const PantallaRegistro(),
    );
  }
}

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  // -- Usando estos componentes podemos automatizar la recolección y validación de datos del formulario. --

  // LLave del formulario que será utilizada para las validaciones de cada campo.
  final _formKey = GlobalKey<FormState>();

  // Los controladores del campo de texto para obtener los valores introducidos por el usuario.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Métodos de validación para los campos. Si devuelven nulo es que la validación es correcta.

  // -- Validación del nombre.
  String? _validarNombre(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa tu nombre";
    }
    return null;
  }

  // -- Validación del correo.
  String? _validarCorreo(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa un correo electrónico";
      // Esto utiliza una expresión regular para validar el correo electrónico.
      // Se pone el caracter "r" antes de la expresión para que lo tolere como una cadena cruda: no interpreta los caracteres de escape como \n o \t.
    } else if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(valor)) {
      return "Por favor, ingresa un correo electrónico válido.";
    }
    return null;
  }

  String? _validarPassword(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa una contraseña.";
    }
    return null;
  }

  // Método para enviar el formulario.
  void _enviarFormulario() {
    // Si se posee un estado correcto tras realizar todas las validaciones...
    // En caso de que no haya un estado, se tolerará como falso para enviar el mensaje de error.
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Formulario enviado exitosamente.")),
      );
    } else {
      // Si no es válido porque ha devuelto false o porque no hay un valor, se indica que ha ocurrido un error.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, corrige los errores.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Formulario de Registro")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Campo de Texto para el nombre.
                  TextFormField(
                    controller:
                        _nameController, // Obtiene el nombre del controlador.
                    decoration: const InputDecoration(
                      labelText: "Nombre",
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                    ),
                    validator:
                        _validarNombre, // Y lo valida usando el método declarando anteriormente.
                  ),
                  // Separación entre campos de texto.
                  const SizedBox(height: 16),

                  TextFormField(
                    controller:
                        _emailController, // Obtenemos el correo electrónico.
                    decoration: const InputDecoration(
                      labelText: "Correo Electrónico",
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        _validarCorreo, // Y lo valida con el método correspondiente.
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                    ),
                    obscureText: true,
                    validator: _validarPassword,
                  ),

                  const SizedBox(height: 20),

                  // Botón para enviar el formulario.
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        140,
                        50,
                      ), // Cambiamos el ancho y alto.
                    ),
                    onPressed: _enviarFormulario,
                    child: const Text("Registrar"),
                  ),
                ], // Especificamos que es de Widgets para respetar las buenas prácticas.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
