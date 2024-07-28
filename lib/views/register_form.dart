import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _cedulaController = TextEditingController();

  String? _sexo;
  bool _isSubscribed = false;
  bool _isSubmitted = false;

  void _limpiar() {
    _apellidoController.clear();
    _nombreController.clear();
    _correoController.clear();
    _telefonoController.clear();
    _cedulaController.clear();
    setState(() {
      _sexo = null;
      _isSubscribed = false;
      _isSubmitted = false;
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate() && _sexo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CLIENTE REGISTRADO EXITOSAMENTE")),
      );
      // Navigate based on subscription status
      Navigator.pushNamed(context, 'menu_form');
    } else {
      setState(() {
        _isSubmitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'FORMULARIO PUCE'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // CÉDULA
              TextFormField(
                controller: _cedulaController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Cédula".toUpperCase(),
                  prefixIcon: const Icon(Icons.credit_card),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese Cédula Válida";
                  }
                  if (value.length > 10) {
                    return "La cédula no puede tener más de 10 dígitos";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // APELLIDOS
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Apellidos".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese Apellido Válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // NOMBRES
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Nombres".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese Nombre Válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // CORREO
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Correo Electrónico".toUpperCase(),
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese Correo Electrónico Válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // TELÉFONO
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Teléfono".toUpperCase(),
                  prefixIcon: const Icon(Icons.phone),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese Teléfono Válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // SEXO
              InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Sexo".toUpperCase(),
                  errorText: _isSubmitted && _sexo == null
                      ? "Seleccione una opción"
                      : null,
                ),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text("Masculino"),
                      value: "Masculino",
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("Femenino"),
                      value: "Femenino",
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // BOTÓN LIMPIAR
              ElevatedButton(
                onPressed: _limpiar,
                child: Text("Limpiar".toUpperCase()),
              ),
              const SizedBox(height: 10),
              // BOTÓN ENVIAR
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text("Enviar".toUpperCase()),
              ),
              const SizedBox(height: 20),
              // BOTÓN LIMPIAR
            ],
          ),
        ),
      ),
    );
  }
}
