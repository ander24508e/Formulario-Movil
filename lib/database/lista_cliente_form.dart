import 'package:flutter/material.dart';
import 'package:formulario_movil/database/database_form.dart'; /// Asegúrate de que la ruta sea correcta

class ListaClientes extends StatelessWidget {
  final DataBaseForm _db = DataBaseForm();

  Future<List<Map<String, dynamic>>> _getClients() async {
    return await _db.getClients(); // Asegúrate de que tengas un método para obtener los clientes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'.toUpperCase()),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getClients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar clientes'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay clientes registrados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var client = snapshot.data![index];
                return ListTile(
                  title: Text(client['nombre'] ?? ''),
                  subtitle: Text(client['correo'] ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
