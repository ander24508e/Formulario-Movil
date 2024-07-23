import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClienteForm extends StatefulWidget {
  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _formKey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  String? _sexo;
  String? _estadoCivil;
  bool _isSubmitted = false;

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return "Seleccione una opción";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, 'menu_form');
            },
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
        title: Text(
          'Formulario Clientes'.toUpperCase(),
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
              // ESTADO CIVIL
              DropdownButtonFormField<String>(
                value: _estadoCivil,
                onChanged: (String? newValue) {
                  setState(() {
                    _estadoCivil = newValue;
                  });
                },
                items: <String>[
                  "Soltero",
                  "Casado",
                  "Divorciado",
                  "Union Libre",
                  "Ricardo Arias"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Estado Civil".toUpperCase(),
                  prefixIcon: const Icon(Icons.people),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: _validateDropdown,
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
              // BOTÓN ENVIAR
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                  });
                  if (_formKey.currentState!.validate() && _sexo != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("CLIENTE REGISTRADO EXITOSAMENTE")),
                    );
                  }
                },
                child: const Text("REGISTRAR"),
              ),
              const SizedBox(height: 5),
              // BOTÓN VOLVER
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'menu_form');
                },
                child: const Text("VOLVER"),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
