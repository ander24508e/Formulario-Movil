import 'package:flutter/material.dart';
import 'views/cliente_form.dart';
import 'views/login_form.dart';
import 'views/menu_form.dart';
import 'views/encuesta_form.dart';
import 'views/orden_form.dart';

void main() {
  runApp(const FormularioApp());
}

class FormularioApp extends StatelessWidget {
  const FormularioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FORMULARIO",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: LoginForm(),
        routes: {
          'cliente_form': (context) => ClienteForm(),
          'menu_form': (context) => MenuForm(),
          'encuesta_form': (context) => EncuestaForm(),
          'orden_form': (context) => OrdenForm()
        });
  }
}
