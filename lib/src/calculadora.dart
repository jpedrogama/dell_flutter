import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  Calculadora({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String preview = '0';

  double lastValues = 0;
  double primaryValues = 0;

  String lastInput = '';

  String lastOp = '';

  bool isEnable = true;

  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [previewWidget(), options()],
        ),
      ),
    );
  }

  Widget numbers() {
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 2;

    return Flexible(
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 3,
        children: List<int>.generate(9, (i) => i + 1)
            .map<Widget>((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => store(e),
                      child: Text('${e}'),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder())),
                ))
            .toList(),
      ),
    );
  }

  Widget clear() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 14;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: itemHeight,
              child: ElevatedButton(
                  onPressed: delete,
                  child: Text("APAGAR"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder())),
            ),
          ),
        )
      ],
    );
  }

  Widget zero() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 14;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: itemWidth,
        height: itemHeight,
        child: ElevatedButton(
            onPressed: () => store(0),
            child: Text("0"),
            style: ElevatedButton.styleFrom(shape: StadiumBorder())),
      ),
    );
  }

  Widget opoperations() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 10;
    final double itemWidth = size.width / 5;
    List<String> opera = ['=', '+', '-', '*', '/'];
    return SizedBox(
      width: itemWidth,
      child: GridView.extent(
        maxCrossAxisExtent: itemWidth,
        childAspectRatio: (itemWidth / itemHeight),
        children: opera.reversed
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: isEnable
                          ? () => actionOp(e)
                          : (e == '=' ? () => actionOp(e) : null),
                      child: Text("$e"),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder())),
                ))
            .toList(),
      ),
    );
  }

  actionOp(e) {
    if (e == '=') {
      printResult();
    } else {
      lastOp = e;
      printPreview(e);
    }
  }

  double calculate(String e, double v1, double v2) {
    switch (e) {
      case '+':
        {
          return v1 + v2;
        }
      case '-':
        {
          return v1 - v2;
        }
      case '*':
        {
          return v1 * v2;
        }
      case '/':
        {
          return v1 / v2;
        }
      default:
        return 0;
    }
  }

  void store(int number) {
    if (lastOp.isEmpty) {
      if (this.lastInput.isEmpty || preview == '0') {
        primaryValues = number.toDouble();
      } else {
        primaryValues = double.tryParse("$primaryValues${number.toDouble()}")!;
      }
    } else {
      if (lastValues == 0) {
        lastValues = number.toDouble();
      } else {
        lastValues = double.tryParse("$lastValues${number.toDouble()}")!;
      }
      blockInput();
    }

    printPreview(number.toString());
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  delete() {
    setState(() {
      preview = '0';

      lastValues = 0;

      primaryValues = 0;

      lastInput = '';

      lastOp = '';

      isEnable = true;
    });
  }

  printPreview(String lastInput) {
    setState(() {
      if (this.lastOp.isEmpty) {
        preview = '$primaryValues';
      } else if (lastInput == this.lastOp) {
        preview = '$primaryValues$lastOp';
      } else {
        preview = '$primaryValues$lastOp$lastValues';
      }
    });

    this.lastInput = lastInput.toString();
  }

  blockInput() {
    setState(() {
      isEnable = false;
    });
  }

  void printResult() {
    if (isNumeric(lastInput)) {
      setState(() {
        double result = calculate(lastOp, primaryValues, lastValues);
        preview = result.toString();
        isEnable = true;
        primaryValues = result;
        lastValues = 0;
      });
    }
  }

  previewWidget() {
    return Expanded(
      child: SizedBox.expand(
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      preview,
                      style: TextStyle(
                        fontSize: 100,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.blue[700]!,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  options() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [clear(), numbers(), zero()],
            ),
          ),
          opoperations(),
        ],
      ),
    );
  }
}
