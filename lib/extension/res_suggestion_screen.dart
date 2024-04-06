import 'package:flutter/material.dart';
import 'package:app_mob_demo_ecom/helper/data.dart';

class RestaurantSuggestion extends StatefulWidget {
  const RestaurantSuggestion({super.key});

  @override
  State<RestaurantSuggestion> createState() => _RestaurantSuggestionState();
}

class _RestaurantSuggestionState extends State<RestaurantSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          //color: const Color.fromARGB(255, 255, 252, 241),
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgGridList.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 150,
                        height: 150,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    imgGridList[index]["imgURL"],
                                    fit: BoxFit.fill,
                                    width: 150,
                                    height: 100,
                                  ),
                                ),
                                Positioned(
                                  left: -10,
                                  bottom: 10,
                                  width: 30,
                                  height: 30,
                                  child: Image.network(
                                    "https://cdn.iconscout.com/icon/premium/png-512-thumb/dragon-10890138-8749272.png?f=webp&w=256",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    child: const Row(
                                      children: [
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 140,
                              height: 20,
                              color: Colors.transparent,
                              child: Text(
                                imgGridList[index]["imgText"],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 20,
                              color: Colors.transparent,
                              child: Text(
                                imgGridList[index]["flatOffer"],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 101, 183)),
                              ),
                            )
                          ],
                        )),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
