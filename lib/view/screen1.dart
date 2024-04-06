import 'package:app_mob_demo_ecom/constant.dart';
import 'package:app_mob_demo_ecom/extension/carousel_slider.dart';
import 'package:app_mob_demo_ecom/extension/gold_banner.dart';
import 'package:app_mob_demo_ecom/extension/must_try.dart';
import 'package:app_mob_demo_ecom/extension/offers.dart';
import 'package:app_mob_demo_ecom/extension/popular_restaurant.dart';
import 'package:app_mob_demo_ecom/extension/res_suggestion_screen.dart';
import 'package:app_mob_demo_ecom/extension/staggered_grid_screen.dart';
import 'package:app_mob_demo_ecom/helper/title_widget.dart';
import 'package:app_mob_demo_ecom/helper/data.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> selectedCategories = [];
  bool filterVisible = false;
  bool isLoading = true; // Initially set to true to show the loader

  @override
  void initState() {
    super.initState();
    loadData(); // Call your method to load data
  }

  void loadData() {
    // Simulate loading data, e.g., from an API
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false; // Set isLoading to false to hide the loader
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 190, 255, 192),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(125),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffdcdcdc)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      labelStyle: TextStyle(fontSize: 12.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.red,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                //MARK: FILTERCHIP SECTION
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.white,
                  height: 85,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FilterChip(
                              avatar: const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 248, 139, 131),
                                size: 20,
                              ),
                              side: BorderSide.none,
                              selectedColor: Colors.amber,
                              elevation: 1,
                              shadowColor: Colors.amber,
                              backgroundColor:
                                  const Color.fromARGB(255, 218, 250, 219),
                              selected: selectedCategories.contains(category),
                              label: Text(category),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedCategories.add(category);
                                  } else {
                                    selectedCategories.remove(category);
                                  }
                                  filterVisible = selectedCategories.isNotEmpty;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          pinned: true,
          //floating: true,
          expandedHeight: 285,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.blurBackground],
            background: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://st1.latestly.com/wp-content/uploads/2022/04/Ramzan-Mubarak-Ho-1-784x441.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Implement your action here
                      },
                    ),
                    actions: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: const EdgeInsets.all(5.0),
                          color: Colors.green,
                          child: const Text(
                            "S",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Visibility(
            visible: filterVisible,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const OfferSection(),
                //Gold Banner Widget
                const GoldBanner(),
                // // const SizedBox(height: 10),
                const CarouselScreen(),
                // // const SizedBox(height: 10),
                const TitleWidget(
                  title: "RESTAURANT SUGGESTION",
                  bgColor: lightBlue,
                  bottomHeight: 30,
                ),
                const RestaurantSuggestion(),
                const TitleWidget(
                  title: "WHAT ARE YOU LOOKING FOR",
                  bgColor: lightOrange,
                  bottomHeight: 20,
                ),
                const StaggGridScreen(),
                const TitleWidget(
                  title: "MUST-TRIES IN DUBAI",
                  bgColor: lightRed,
                  bottomHeight: 20,
                ),
                const MustTry(),
                const TitleWidget(
                  title: "POPULAR RESTAURANT AROUND YOU",
                  bgColor: lightPink,
                  bottomHeight: 20,
                ),
                PopularRestaurant(selectedCategories: selectedCategories),
              ],
            ),
            child: isLoading
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red[300],
                        strokeWidth: 3.0,
                      ),
                    ),
                  )
                : PopularRestaurant(selectedCategories: selectedCategories),
          ),
        ),
        //Offer section Widget

        //FILTER SECTION
      ],
    );
  }
}
