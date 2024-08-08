import 'package:flutter/material.dart';
import 'package:formulario_movil/views/ubicacion_form.dart';
import 'views/cliente_form.dart';
import 'views/login_form.dart';
import 'views/menu_form.dart';
import 'views/encuesta_form.dart';
import 'views/orden_form.dart';
import 'views/register_form.dart';
import 'empresaforms/empresa_form.dart';
import 'database/lista_cliente_form.dart';

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
        home: EmpresaForm(),
        routes: {
          'empresa_form': (context) => EmpresaForm(),
          'login_form': (context) => LoginForm(),
          'register_form': (context) => RegisterForm(),
          'cliente_form': (context) => ClienteForm(),
          'lista_clientes_form': (context) => ListaClientes(),
          'menu_form': (context) => MenuForm(),
          'encuesta_form': (context) => EncuestaForm(),
          'orden_form': (context) => OrdenForm(),
          'ubicacion_form': (context) => UbicacionForm()
        });
  }
}
