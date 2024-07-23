import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdenForm extends StatefulWidget {
  @override
  State<OrdenForm> createState() => _OrdenFormState();
}

class _OrdenFormState extends State<OrdenForm> {
  final _formKey = GlobalKey<FormState>();
  final _orden1Controller = TextEditingController();
  final _orden2Controller = TextEditingController();
  final _orden3Controller = TextEditingController();
  final _orden4Controller = TextEditingController();

  bool _isSubmitted = false;

  void _limpiar() {
    _orden1Controller.clear();
    _orden2Controller.clear();
    _orden3Controller.clear();
    _orden4Controller.clear();
    setState(() {
      _isSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, 'menu_form');
          },
        ),
        title: Text(
          'Orden de trabajo'.toUpperCase(),
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
              const SizedBox(height: 20),
              // ORDEN DE TRABAJO 1
              TextFormField(
                controller: _orden1Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Tarea 1".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese una orden de trabajo valida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ORDEN DE TRABAJO 2
              TextFormField(
                controller: _orden2Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Tarea 2".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese una orden de trabajo valida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _orden3Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Tarea 3".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese una orden de trabajo valida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _orden4Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Tarea 4".toUpperCase(),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese una orden de trabajo valida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "ORDENES DE TRABAJO AGREGADAS SATISFACTORIAMENTE")),
                    );
                  }
                },
                child: const Text("ENVIAR"),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: _limpiar,
                child: const Text("LIMPIAR"),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
