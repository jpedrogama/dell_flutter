import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  ButtonStyle? _style;

  set style(ButtonStyle value) {
    _style = value;
  }

  BaseButton({
    required this.onPressed,
    required this.text,
    required this.color,
    style
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: _style ?? ElevatedButton.styleFrom(
              primary: color,
              padding: EdgeInsets.all(10.0),
              ),
          onPressed: () => onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
