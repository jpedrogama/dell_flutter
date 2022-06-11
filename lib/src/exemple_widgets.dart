import 'package:dell_flutter/src/widgets/base_button.dart';
import 'package:dell_flutter/src/widgets/base_button_with_icon.dart';
import 'package:dell_flutter/src/widgets/rounded_button.dart';
import 'package:dell_flutter/src/widgets/rounded_button_with_icon.dart';
import 'package:flutter/material.dart';

class Exemple extends StatelessWidget {
  const Exemple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BaseButton(
                      onPressed: () {},
                      text: "BASE BUTTON",
                      color: Colors.black54),
                  BaseButton(
                      onPressed: () {},
                      text: "BASE BUTTON BLUE",
                      color: Colors.blue),
                  BaseButton(
                      onPressed: () {},
                      text: "BASE BUTTON GREEN",
                      color: Colors.green),
                  RoundedButton(
                    color: Colors.black54,
                    onPressed: () {},
                    text: "ROUNDED BUTTON",
                  ),
                  RoundedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    text: "ROUNDED BUTTON BLUE",
                  ),
                  RoundedButton(
                    color: Colors.yellow,
                    onPressed: () {},
                    text: "ROUNDED BUTTON YELLOW",
                  ),
                  BaseButtonWithIcon(onPressed: (){}, text: "BASE BUTTON WITH ICON", color: Colors.black54, icon: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 24.0,
                  )),
                  BaseButtonWithIcon(onPressed: (){}, text: "BASE BUTTON WITH ICON RED", color: Colors.red, icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                  )),
                  RoundedButtonWithIcon(color: Colors.blue, text: "ROUNDED BUTTON WITH ICON", onPressed: (){}, icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
