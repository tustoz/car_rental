import 'package:car_rental/screens/detail.dart';
import 'package:car_rental/screens/rented.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:car_rental/data/car.dart';
import 'package:car_rental/data/brand.dart';
import 'package:car_rental/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Brands>(create: (context) => Brands()),
        ChangeNotifierProvider<Cars>(create: (context) => Cars()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: size.height * 0.07,
                width: size.width,
                margin: const EdgeInsets.fromLTRB(15, 20, 16, 24),
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 14),
                decoration: BoxDecoration(
                  color: kShadeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for brand...',
                    hintStyle: kSearchHint,
                    icon: Image.asset('assets/images/search.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Searched',
                      style: kSectionTitle,
                    ),
                    Text(
                      'View all',
                      style: kViewAll,
                    ),
                  ],
                ),
              ),
              Consumer<Brands>(
                builder: (context, item, _) => SizedBox(
                  height: size.height * 0.19,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: item.brands.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        height: size.height * 0.07,
                        width: size.width * 0.35,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(12, 16, 0, 11),
                        decoration: BoxDecoration(
                          color: kShadeColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              item.brands[i].imageUrl,
                              scale: 0.9,
                            ),
                            const SizedBox(height: 9),
                            Text(
                              item.brands[i].name,
                              style: kBrand,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 24, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recently Rented',
                      style: kSectionTitle,
                    ),
                    Consumer<Cars>(
                      builder: (context, item, _) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecentlyRented(
                                item: item,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'View all',
                          style: kViewAll,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Consumer<Cars>(
                builder: (context, item, _) => SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: item.cars.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                name: item.cars[i].name,
                                brand: item.cars[i].brand,
                                imageUrl: item.cars[i].imageUrl,
                                description: item.cars[i].description,
                                speed: item.cars[i].speed,
                                seats: item.cars[i].seats,
                                engine: item.cars[i].engine,
                                price: item.cars[i].price,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.65,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          padding: const EdgeInsets.fromLTRB(12, 16, 12, 11),
                          decoration: BoxDecoration(
                            color: kShadeColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.cars[i].name,
                                        style: kBrand,
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/star.png'),
                                          const SizedBox(width: 4),
                                          Text(
                                            item.cars[i].stars,
                                            style: kRate.apply(
                                              color:
                                                  kTextColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: size.width * 0.1,
                                    width: size.width * 0.1,
                                    decoration: BoxDecoration(
                                      color: kShadeColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.asset(
                                        'assets/images/active-saved.png'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Hero(
                                  tag: item.cars[i].imageUrl,
                                  child: Image.asset(
                                    item.cars[i].imageUrl,
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/cost.png'),
                                  const SizedBox(width: 8),
                                  Row(
                                    children: [
                                      Text(
                                        item.cars[i].price,
                                        style: kPrice,
                                      ),
                                      Text(
                                        '/week',
                                        style: kPrice.copyWith(
                                          color: kTextColor.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 24, 15, 13),
                child: Text('Top Dealers', style: kSectionTitle),
              ),
              Container(
                width: size.width,
                height: size.height * 0.1,
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kShadeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/kristy.png'),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Kristy's Garage", style: kBrand),
                        const SizedBox(height: 3),
                        Text(
                          "123 Swanston Street, Melbourne VIC",
                          style: kBrand.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
