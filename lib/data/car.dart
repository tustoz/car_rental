import 'package:flutter/foundation.dart';

class Car with ChangeNotifier {
  final String name;
  final String brand;
  final String imageUrl;
  final String description;
  final String speed;
  final String seats;
  final String engine;
  final String stars;
  final String price;
  final String date;
  final String duration;

  Car({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.description,
    required this.speed,
    required this.seats,
    required this.engine,
    required this.stars,
    required this.price,
    required this.date,
    required this.duration,
  });
}

class Cars with ChangeNotifier {
  List<Car> cars = [
    Car(
      brand: 'assets/images/porshce.png',
      name: 'Porsche Panamera',
      imageUrl: 'assets/images/panamera.png',
      description:
          'The Porsche Panamera is a mid/full-sized luxury\nvehicle (E-segment in Eurrope) manufac... More',
      speed: '315 km/h',
      seats: '5',
      engine: '4.0 L VB',
      stars: '4.5',
      price: r'$700',
      date: '01  Sep 2021',
      duration: '3 week',
    ),
    Car(
      brand: 'assets/images/lamborghini.png',
      name: 'Lamborghini Huracan',
      imageUrl: 'assets/images/huracan.png',
      description:
          'The Porsche Panamera is a mid/full-sized luxury\nvehicle (E-segment in Eurrope) manufac... More',
      speed: '315 km/h',
      seats: '5',
      engine: '4.0 L VB',
      stars: '4.7',
      price: r'$900',
      date: '21  Jun 2021',
      duration: '1 week',
    ),
  ];
}
