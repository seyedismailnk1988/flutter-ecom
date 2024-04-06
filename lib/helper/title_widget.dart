import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final LinearGradient bgColor;
  final double bottomHeight;
  const TitleWidget(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.bottomHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: bgColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 212, 202, 201)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 212, 202, 201)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: bottomHeight),
        ],
      ),
    );
  }
}
