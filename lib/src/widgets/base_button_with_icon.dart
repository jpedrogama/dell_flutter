import 'package:flutter/material.dart';

class BaseButtonWithIcon extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  ButtonStyle? _style;
  final Widget icon;

  set style(ButtonStyle value) {
    _style = value;
  }

  BaseButtonWithIcon({
    required this.onPressed,
    required this.text,
    required this.color,
    required this.icon,
    style
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          style: _style ?? ElevatedButton.styleFrom(
              primary: color,
              padding: EdgeInsets.all(10.0),
              ),
          onPressed: () => onPressed,
          icon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: icon,
          ),
          label: Padding(
            padding: const EdgeInsets.only(right: 8.0,bottom:  8.0, top: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                letterSpacing: 1.0,
                fontFamily: 'MazzardM',
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
