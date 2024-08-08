import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/login_form.dart';
import 'package:formulario_movil/empresaforms/page_form.dart';

class EmpresaForm extends StatefulWidget {
  @override
  _EmpresaFormPageState createState() => _EmpresaFormPageState();
}

class _EmpresaFormPageState extends State<EmpresaForm> {
  bool showInicio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'CONCESIONARIA'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                      backgroundImage:
                          AssetImage('lib/imagenes/loginlogo.jpg')),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductosDetailForm()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.open_in_browser,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm()),
                );
              },
            ),
          ],
        ),
      ),
      body: showInicio
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bienvenido a nuestra Concesionaria de Vehículos',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Encuentra el auto de tus sueños con nosotros.',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Nuestros Servicios:',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Venta de vehículos nuevos y usados\n'
                      '- Financiamiento personalizado\n'
                      '- Servicio de mantenimiento y reparaciones\n'
                      '- Asesoramiento en seguros vehiculares',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '¿Por qué elegirnos?',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Amplia gama de vehículos de diferentes marcas\n'
                      '- Personal altamente capacitado\n'
                      '- Instalaciones modernas y cómodas\n'
                      '- Atención al cliente excepcional',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Visítanos y descubre las mejores ofertas en vehículos del mercado.',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Ver Vehículos Disponibles',
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
