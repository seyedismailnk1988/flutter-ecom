import 'package:flutter/material.dart';
import 'package:app_mob_demo_ecom/helper/data.dart';

class MustTry extends StatefulWidget {
  const MustTry({super.key});

  @override
  State<MustTry> createState() => _MustTryState();
}

class _MustTryState extends State<MustTry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgGridList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100)),
              child: Stack(
                children: [
                  Image.network(
                    imgGridList[index]["imgURL"],
                    fit: BoxFit.fill,
                    width: 180,
                    height: 180,
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black
                          .withOpacity(0.5), // Opacity background color
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        imgGridList[index]["imgText"],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
