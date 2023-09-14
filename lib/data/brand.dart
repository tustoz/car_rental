import 'package:flutter/foundation.dart';

class Brand with ChangeNotifier {
  final String name;
  final String imageUrl;

  Brand({
    required this.name,
    required this.imageUrl,
  });
}

class Brands with ChangeNotifier {
  List<Brand> brands = [
    Brand(
      name: 'Porsche',
      imageUrl: 'assets/images/porshce.png',
    ),
    Brand(
      name: 'Mercedes',
      imageUrl: 'assets/images/mercedes.png',
    ),
    Brand(
      name: 'Lamborghini',
      imageUrl: 'assets/images/lamborghini.png',
    ),
  ];
}
