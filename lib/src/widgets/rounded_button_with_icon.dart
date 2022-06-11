import 'package:dell_flutter/src/widgets/base_button_with_icon.dart';
import 'package:flutter/material.dart';

import 'base_button.dart';

class RoundedButtonWithIcon extends BaseButtonWithIcon {
  final Color color;
  final String text;
  final Function onPressed;
  final Widget icon;

  RoundedButtonWithIcon({required this.color, required this.text, required this.onPressed, required this.icon}) : super(color: color, text: text, onPressed: onPressed, icon: icon){
    super.style = ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(10.0),
        shape: StadiumBorder());
  }
}
