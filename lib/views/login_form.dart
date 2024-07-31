import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String clave_correcta = 'root1234';

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Usuario Incorrecto";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Contraseña Incorrecta";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo de la app en negro
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'lavadora endara'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // Cambia la posición de la sombra
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage('lib/imagenes/logolavadora.png')),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Usuario".toUpperCase(),
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                  ),
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                  ),
                  validator: _validateUsername,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Contraseña".toUpperCase(),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                  ),
                  obscureText: true,
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                  ),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_usernameController.text != 'ander') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Usuario incorrecto")),
                            );
                          } else if (_passwordController.text !=
                              clave_correcta) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Contraseña incorrecta")),
                            );
                          } else {
                            Navigator.pushNamed(context, 'menu_form');
                          }
                        }
                      },
                      child: const Text(
                        "INICIAR SESIÓN",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register_form');
                      },
                      child: const Text(
                        "REGISTRARSE",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
