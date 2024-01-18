import 'package:flutter/material.dart';

class ReusebleCard // ignore: empty_constructor_bodies
    extends StatelessWidget {
  ReusebleCard({colour, cardChild, pressKaro}) {
    rang = colour;
    cardShur = cardChild;
    yelPressKaro = pressKaro;
    super.key;
  }

  late final Color? rang;
  late final Widget? cardShur;
  late final VoidCallback? yelPressKaro;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: yelPressKaro,
      child: Container(
        margin: const EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: rang,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: cardShur,
      ),
    );
  }
}
