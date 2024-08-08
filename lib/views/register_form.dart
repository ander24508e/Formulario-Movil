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
  final _contrasena = TextEditingController();
  final _confirmarcontrasena = TextEditingController();
  final _cedulaController = TextEditingController();

  String? _sexo;
  bool _isSubmitted = false;

  void _limpiar() {
    _apellidoController.clear();
    _nombreController.clear();
    _correoController.clear();
    _telefonoController.clear();
    _cedulaController.clear();
    _contrasena.clear();
    _confirmarcontrasena.clear();

    setState(() {
      _sexo = null;
      _isSubmitted = false;
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate() && _sexo != null) {
      if (_contrasena.text != _confirmarcontrasena.text) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Las contraseñas no coinciden."),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("CLIENTE REGISTRADO EXITOSAMENTE")),
        );
        // Navigate based on subscription status
        Navigator.pushNamed(context, 'menu_form');
      }
    } else {
      bool allFieldsEmpty = _apellidoController.text.isEmpty &&
          _nombreController.text.isEmpty &&
          _correoController.text.isEmpty &&
          _telefonoController.text.isEmpty &&
          _cedulaController.text.isEmpty &&
          _contrasena.text.isEmpty &&
          _confirmarcontrasena.text.isEmpty;

      if (allFieldsEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text(
                  "Todos los campos están vacíos. Por favor, complete los campos."),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _isSubmitted = true;
        });
      }
    }
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor seleccione un sexo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'FORMULARIO LAVADORA ENDARA'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _cedulaController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Cédula',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Cédula Válida';
                  }
                  if (value.length > 10) {
                    return 'La cédula no puede tener más de 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombres',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Nombre Válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Correo Electrónico Válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contrasena,
                obscureText: true,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Contraseña Válida';
                  }
                  if (value.length > 10) {
                    return 'La contraseña no puede tener más de 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmarcontrasena,
                obscureText: true,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Contraseña Válida';
                  }
                  if (value.length > 10) {
                    return 'La contraseña no puede tener más de 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese Teléfono Válido';
                  }
                  if (value.length > 10) {
                    return 'El teléfono no puede tener más de 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _sexo,
                onChanged: (String? newValue) {
                  setState(() {
                    _sexo = newValue;
                  });
                },
                items: <String>["Masculino", "Femenino"]
                    .map<DropdownMenuItem<String>>((String value) {
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
                  hintText: "Sexo".toUpperCase(),
                  prefixIcon: const Icon(Icons.transgender),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: _validateDropdown,
              ),
              if (_isSubmitted && _sexo == null)
                const Text(
                  'Por favor seleccione un sexo',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: const Text('Registrar'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _limpiar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: const Text('Limpiar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
