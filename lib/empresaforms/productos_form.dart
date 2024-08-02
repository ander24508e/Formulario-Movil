import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/login_form.dart';
import 'package:formulario_movil/empresaforms/page_form.dart';

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
        backgroundColor: Colors.teal,
        title: Text(
          'lavadora endara'.toUpperCase(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductosDetailForm()),
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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'https://img.freepik.com/psd-premium/psd-servicio-lavado-autos-promocion-alquiler-oferta-especial-folleto-redes-sociales-anuncio-diseno-carteles_797457-45.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
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
