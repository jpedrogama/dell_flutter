import 'package:flutter/material.dart';

import 'base_button.dart';

class RoundedButton extends BaseButton {
  final Color color;
  final String text;
  final Function onPressed;

  RoundedButton({required this.color, required this.text, required this.onPressed}) : super(color: color, text: text, onPressed: onPressed){
    super.style = ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(10.0),
        shape: StadiumBorder());
  }
}
