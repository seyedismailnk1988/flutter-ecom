import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

int activeIndex = 0;
final List<String> imgList = [
  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1511782846297-947487389478?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];

final List<Map<String, dynamic>> textOnImage = [
  {
    "offer": "10%",
    "titleRestaurant": "Bengaluru Nati Mane Restaurant",
    "textsubhead": "From the heart of Karnataka"
  },
  {
    "offer": "20%",
    "titleRestaurant": "Morgan Gastropub - Al bandar Ratana",
    "textsubhead": "Sip savour & Socialite"
  },
  {
    "offer": "30%",
    "titleRestaurant": "Amristsr Restaurant",
    "textsubhead": "Maharaja of indian cuisine"
  },
];

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    //List<int> list = [1, 2, 3, 4, 5];
    //final double height = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.all(0),
        width: double.infinity,
        child: Column(
          children: [
            CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  //when scroll the image Dot image changed setState function
                  onPageChanged: (index, reason) {
                    setState(() => activeIndex = index);
                  },
                ),
                itemCount: imgList.length,
                itemBuilder: (context, index, intID) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Image.network(
                          imgList[index],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.offline_pin_rounded,
                                      size: 20.0,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Flat ${textOnImage[index]["offer"]} offer",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          left: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "${textOnImage[index]["titleRestaurant"]}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(221, 0, 0, 0),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "${textOnImage[index]["textsubhead"]}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: imgList.length,
              effect: const WormEffect(
                dotWidth: 20,
                dotHeight: 20,
              ),
            )
          ],
        ));
  }
}
