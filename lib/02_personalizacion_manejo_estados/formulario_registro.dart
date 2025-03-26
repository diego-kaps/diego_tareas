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
  // Llave para identificar el formulario y validar sus campos.
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar la entrada de los usuarios.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validación del campo de nombre.
  String? _validarNombre(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa tu nombre";
    }
    return null;
  }

  // Validación del correo electrónico.
  String? _validarCorreo(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa un correo electrónico";
    } else if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(valor)) {
      return "Por favor, ingresa un correo electrónico válido.";
    }
    return null;
  }

  // Validación de la contraseña.
  String? _validarPassword(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Por favor, ingresa una contraseña.";
    }
    return null;
  }

  // Envía el formulario si la validación es correcta.
  void _enviarFormulario() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Formulario enviado exitosamente.")),
      );
    } else {
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
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Campo de entrada para el nombre.
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Nombre",
                      filled: true,
                      fillColor: Color.fromARGB(255, 251, 251, 251),
                    ),
                    validator: _validarNombre,
                  ),
                  const SizedBox(height: 16),

                  // Campo de entrada para el correo electrónico.
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Correo Electrónico",
                      filled: true,
                      fillColor: Color.fromARGB(255, 251, 251, 251),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validarCorreo,
                  ),
                  const SizedBox(height: 16),

                  // Campo de entrada para la contraseña.
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      filled: true,
                      fillColor: Color.fromARGB(255, 251, 251, 251),
                    ),
                    obscureText: true,
                    validator: _validarPassword,
                  ),
                  const SizedBox(height: 20),

                  // Botón para enviar el formulario.
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 50),
                    ),
                    onPressed: _enviarFormulario,
                    child: const Text("Registrar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
