import 'package:flutter/material.dart';
import 'package:formulario_movil/database/lista_cliente_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:formulario_movil/database/database_form.dart';

class ClienteForm extends StatefulWidget {
  @override
  _ClienteFormState createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _cedulaController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  String? _sexo;
  String? _estadoCivil;
  final DataBaseForm _db = DataBaseForm();

  final _formKey = GlobalKey<FormState>();

  void _addClient() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'cedula': _cedulaController.text,
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text,
        'sexo': _sexo,
        'estadoCivil': _estadoCivil,
        'direccion': _direccionController.text, // Agrega dirección al map
      };
      await _db.insertClient(client);
      _clearForm();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ListaClientes()),
        );
      }
    }
  }

  void _clearForm() {
    _apellidoController.clear();
    _nombreController.clear();
    _correoController.clear();
    _telefonoController.clear();
    _cedulaController.clear();
    _direccionController.clear();
    setState(() {
      _sexo = null;
      _estadoCivil = null;
    });
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor selecciona una opción';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Formulario Cliente'.toUpperCase(),
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
                  labelText: 'CÉDULA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.credit_card_outlined),
                  prefixIconColor: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su cédula';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _apellidoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'APELLIDO',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: Colors.black,
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'NOMBRE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'CORREO',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _direccionController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'DIRECCIÓN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.directions),
                  prefixIconColor: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su dirección';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _telefonoController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'TELÉFONO',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  prefixIconColor: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su teléfono';
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
                  prefixIconColor: Colors.black,
                ),
                validator: _validateDropdown,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _estadoCivil,
                onChanged: (String? newValue) {
                  setState(() {
                    _estadoCivil = newValue;
                  });
                },
                items: <String>["Soltero", "Casado", "Divorciado"]
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
                  hintText: "Estado Civil".toUpperCase(),
                  prefixIcon: const Icon(Icons.family_restroom),
                  prefixIconColor: Colors.black,
                ),
                validator: _validateDropdown,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _addClient,
                  child: Text(
                    'Guardar'.toUpperCase(),
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
