import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductosDetailForm extends StatefulWidget {
  @override
  _ProductosDetailFormPageState createState() =>
      _ProductosDetailFormPageState();
}

class Producto {
  String name;
  String rating;
  String price;
  String description;

  Producto({
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
  });

  String get _name => name;
  String get _rating => rating;
  String get _price => price;
  String get _description => description;
}

List<Producto> productos = [
  Producto(
      name: "Toyota Corolla".toUpperCase(),
      rating: 'NUEVO',
      price: '18,000 Dólares',
      description:
          'Sedán compacto, ideal para la ciudad con excelente economía de combustible.'),
  Producto(
    name: "Ford Mustang GT".toUpperCase(),
    rating: 'USADO',
    price: '25,000 Dólares',
    description: '''
    Deportivo icónico, motor V8, potencia y estilo combinados para una experiencia de conducción emocionante.
    ''',
  ),
  Producto(
    name: "Chevrolet Silverado 1500".toUpperCase(),
    rating: 'NUEVO',
    price: "35,000 Dólares",
    description: '''
    Camioneta robusta con capacidad de carga y remolque excepcionales, ideal para trabajos pesados y aventuras.
    ''',
  ),
  Producto(
    name: "Honda CR-V".toUpperCase(),
    rating: 'USADO',
    price: "22,000 Dólares",
    description: '''
    SUV confiable, perfecto para familias, con gran espacio interior y tecnología avanzada de seguridad.
    ''',
  ),
  Producto(
    name: "Tesla Model 3".toUpperCase(),
    rating: 'NUEVO',
    price: "45,000 Dólares",
    description: '''
    Sedán eléctrico con tecnología de vanguardia, autonomía impresionante y características de conducción autónoma.
    ''',
  ),
];

class _ProductosDetailFormPageState extends State<ProductosDetailForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Lavadora Endara'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    producto.name,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text(
                        producto.rating,
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Precio: ${producto.price}',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Descripción:',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    producto.description,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
