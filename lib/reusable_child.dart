import 'package:flutter/material.dart';
import 'constant.dart';

class reusablechild extends StatelessWidget {
  reusablechild(
      {required IconData this.icn,
      required String this.textgender,
      required this.styletas});

  final IconData icn;
  final String textgender;
  final TextStyle styletas;

  @override
  Widget build(BuildContext context) {
    const double iconsize = 60;
    const double sizedboxheight = 20;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icn,
          size: iconsize,
        ),
        SizedBox(
          height: sizedboxheight,
        ),
        Text(
          textgender,
          style: label_text_style,
        ),
      ],
    );
  }
}
