import 'package:car_rental/data/car.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class RecentlyRented extends StatefulWidget {
  final Cars item;

  const RecentlyRented({Key? key, required this.item}) : super(key: key);

  @override
  _RecentlyRentedState createState() => _RecentlyRentedState();
}

class _RecentlyRentedState extends State<RecentlyRented> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: size.width * 0.1,
                    width: size.width * 0.1,
                    margin: const EdgeInsets.fromLTRB(16, 20, 0, 18),
                    decoration: BoxDecoration(
                      color: kTextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/back-arrow.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Recently Rented', style: kCarTitle),
                  const SizedBox(height: 13),
                  SizedBox(
                    height: size.height * 0.8,
                    child: ListView.builder(
                      itemCount: widget.item.cars.length,
                      itemBuilder: (ctx, i) {
                        return Container(
                          height: size.height * 0.48,
                          width: size.width - 32,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.fromLTRB(16, 11, 8, 10),
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
                                        widget.item.cars[i].name,
                                        style: kBrand,
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/star.png'),
                                          const SizedBox(width: 4),
                                          Text(
                                            widget.item.cars[i].stars,
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
                                  tag: widget.item.cars[i].imageUrl,
                                  child: Image.asset(
                                    widget.item.cars[i].imageUrl,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/cost.png',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Cost',
                                            style: kCarDetails.copyWith(
                                              color:
                                                  kTextColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        widget.item.cars[i].price,
                                        style: kCarDetails.copyWith(
                                            color: kTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/date.png',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Start Date',
                                            style: kCarDetails.copyWith(
                                              color:
                                                  kTextColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        widget.item.cars[i].date,
                                        style: kCarDetails.copyWith(
                                            color: kTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/cost.png',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Duration',
                                            style: kCarDetails.copyWith(
                                              color:
                                                  kTextColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        widget.item.cars[i].duration,
                                        style: kCarDetails.copyWith(
                                            color: kTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '(' +
                                            widget.item.cars[i].price +
                                            '/week)',
                                        style: kCarDetails.copyWith(
                                            color: kTextColor.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
