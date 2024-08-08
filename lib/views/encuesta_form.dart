import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Asegúrate de añadir flutter_rating_bar a tu pubspec.yaml

class EncuestaForm extends StatefulWidget {
  @override
  State<EncuestaForm> createState() => _EncuestaFormState();
}

class _EncuestaFormState extends State<EncuestaForm> {
  final _formKey = GlobalKey<FormState>();
  final _fechaController = TextEditingController();
  double _pregunta1Rating = 2.0; // Valor inicial para el ranking
  double _pregunta2Rating = 2.0;
  double _pregunta3Rating = 2.0; // Valor inicial para el ranking
  double _pregunta4Rating = 2.0; // Valor inicial para el ranking
  bool _isSubmitted = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _fechaController.text = '${pickedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Encuesta'.toUpperCase(),
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
              // Campo para el nombre
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _fechaController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la fecha';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Pregunta 1 con ranking
              Text(
                'Pregunta 1: ¿Cómo calificaría nuestro servicio?',
                style: GoogleFonts.dmSerifDisplay(fontSize: 16),
              ),
              const SizedBox(height: 5),
              RatingBar.builder(
                initialRating: _pregunta1Rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _pregunta1Rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Pregunta 2 con ranking
              Text(
                'Pregunta 2: ¿Qué tan satisfecho está con nuestros servicios?',
                style: GoogleFonts.dmSerifDisplay(fontSize: 16),
              ),
              const SizedBox(height: 5),
              RatingBar.builder(
                initialRating: _pregunta2Rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _pregunta2Rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Pregunta 3: ¿Que recomendaciones le daria a nuestro servicio?',
                style: GoogleFonts.dmSerifDisplay(fontSize: 16),
              ),
              const SizedBox(height: 5),
              RatingBar.builder(
                initialRating: _pregunta3Rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _pregunta3Rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Pregunta 4: ¿Qué le gustaria que le agreguemos a nuestro servicio?',
                style: GoogleFonts.dmSerifDisplay(fontSize: 16),
              ),
              const SizedBox(height: 5),
              RatingBar.builder(
                initialRating: _pregunta4Rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _pregunta4Rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Botón para enviar
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ENCUESTA ENVIADA EXITOSAMENTE"),
                      ),
                    );
                    // Redirigir al menu_form
                    Navigator.pushReplacementNamed(context, 'menu_form');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: Text(
                  "ENVIAR",
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
