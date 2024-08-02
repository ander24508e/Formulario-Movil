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
      name: "Lavada Express".toUpperCase(),
      rating: 'Garantizado',
      price: '6 Dólares',
      description: 'Lavada Express de su Vehiculo - Limpieza interior'),
  Producto(
    name: "Lavada Completa".toUpperCase(),
    rating: '5:00 am - 23:00 pm',
    price: '12 Dólares',
    description: '''
    Lavada Completa de su Vehiculo - Limpieza Interior - Engrasada - Pulverizada
    ''',
  ),
  Producto(
    name: "Lavada Completa con Grafito".toUpperCase(),
    rating: 'GARANTIZADO',
    price: "15 Dólares",
    description: '''
    Lavada Completa de su vehiculo - Limpieza interior - Engrasada - Ducha Grafitada.
    ''',
  ),
];
