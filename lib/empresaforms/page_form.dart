import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_form.dart';

class ProductosForm extends StatefulWidget {
  @override
  _ProductosFormPageState createState() => _ProductosFormPageState();
}

class _ProductosFormPageState extends State<ProductosForm> {
  bool showInicio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lavadora endara'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/imagenes/loginlogo.jpg')),
                  SizedBox(height: 10),
                  Text(
                    'ADMINISTRACION',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.teal,
              ),
              title: const Text(
                'INICIO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  showInicio = true;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.teal,
              ),
              title: const Text(
                'PRODUCTOS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                  Navigator.pushNamed(context, 'ubicacion_form');
                }
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.close,
                color: Colors.teal,
              ),
              title: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                onTap: () {
                  Navigator.pushNamed(context, 'ubicacion_form');
                }
            ),
          ],
        ),
      ),
      body: showInicio
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bienvenido a la administración de Lavadora Endara. Aquí puede gestionar sus productos y acceder a configuraciones.',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Center(
              child: Text(
                'Seleccione una opción del menú.',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
    );
  }
}
