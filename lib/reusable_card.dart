import 'package:flutter/material.dart';
import 'input_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild});
  final Color colour;
  Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
