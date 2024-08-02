import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:formulario_movil/empresaforms/products.dart';

class ProductosDetailForm extends StatefulWidget {
  @override
  _ProductosDetailFormPageState createState() => _ProductosDetailFormPageState();
}

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
      body: PageView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
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
                  'Price: ${producto.price}',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Description:',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      producto.description,
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
