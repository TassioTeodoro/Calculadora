import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora Mobile"),
        ),
        body: Center(
          child: Calculadora(),
        ),
      ),
    );
  }
}


class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  String _input = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operation = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "0";
      _num1 = 0;
      _num2 = 0;
      _operation = "";
      _output = "0";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      _num1 = double.parse(_input);
      _operation = buttonText;
      _input = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);
      if (_operation == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operation == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operation == "*") {
        _output = (_num1 * _num2).toString();
      } else if (_operation == "/") {
        _output = (_num1 / _num2).toString();
      }

      _num1 = 0;
      _num2 = 0;
      _operation = "";
    } else {
      if (_input == "0") {
        _input = buttonText;
      } else {
        _input += buttonText;
      }
      _output = _input;
    }

    setState(() {
      _output = (_output.endsWith('.00')) ? int.parse(_output.split('.')[0]).toString() : _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20), backgroundColor: Colors.blueGrey[800],
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Text(
            _output,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        
        Column(
          children: [
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: [
                buildButton("0"),
                buildButton("C"),
                buildButton("="),
                buildButton("+"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
