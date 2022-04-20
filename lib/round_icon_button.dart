import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required IconData this.icn, required Function this.onpress});
  IconData icn;
  final dynamic onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      disabledElevation: 10,
      elevation: 10,
      child: Icon(icn),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
