import 'package:car_rental/constant.dart';
import 'package:car_rental/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
