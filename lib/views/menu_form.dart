import 'package:flutter/material.dart';

class MenuForm extends StatefulWidget {
  @override
  _MenuFormPageState createState() => _MenuFormPageState();
}

class _MenuFormPageState extends State<MenuForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu de Opciones'),
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
                        radius: 40,
                        backgroundImage:
                            AssetImage('lib/imagenes/logopuce.png')),
                    SizedBox(height: 10),
                    Text(
                      'ANDER',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
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
                  Navigator.pop(context);
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
                title: const Text(
                  'CLIENTES',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'cliente_form');
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.teal,
                ),
                title: const Text(
                  'ORDEN DE TRABAJO',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'orden_form');
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.book_online,
                  color: Colors.teal,
                ),
                title: const Text(
                  'ENCUESTAS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'encuesta_form');
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.teal,
                ),
                title: const Text(
                  'LOCALIZACION',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'ubicacion_form');
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.close,
                  color: Colors.teal,
                ),
                title: const Text(
                  'CERRAR SESIÓN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
