import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:app_mob_demo_ecom/helper/data.dart';

//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggGridScreen extends StatefulWidget {
  const StaggGridScreen({super.key});

  @override
  State<StaggGridScreen> createState() => _StaggGridScreenState();
}

class _StaggGridScreenState extends State<StaggGridScreen> {
  @override
  Widget build(BuildContext context) {
    // List<double> itemHeight = [100, 100, 100, 100, 200, 100, 100, 100, 200];
    //double totalHeight = itemHeight[itemHeight.length];
    return Container(
      padding: const EdgeInsets.all(15),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(
          9,
          (index) {
            int crossAxisCellCount;
            int mainAxisCellCount;

            if (index == 0 || index == 5 || index == 6) {
              crossAxisCellCount = 1;
              mainAxisCellCount = 2;
            } else {
              crossAxisCellCount = 1;
              mainAxisCellCount = 1;
            }

            return StaggeredGridTile.count(
              crossAxisCellCount: crossAxisCellCount,
              mainAxisCellCount: mainAxisCellCount,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(
                                  255, 0, 0, 0), // Bottom color (fully opaque)
                              Colors.transparent
                            ],
                          ),
                        ),
                        child: Image.network(
                          imgGridList[index]["imgURL"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            imgGridList[index]["imgText"],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
