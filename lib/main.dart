import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key?key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    key: Key('AC'),
                    text: 'AC',
                    fillColor: Color(0xFF6C807F),
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    key: Key('C'),
                    text: 'C',
                    fillColor: Color(0xFF6C807F),
                    callback: clear,
                  ),
                  CalcButton(
                key: Key('percent'),
                text: '%',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                callback: numClick,
              ),
              CalcButton(
                key: Key('divide'),
                text: '/',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                key: Key('7'),
                text: '7',
                callback: numClick, fillColor:Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('8'),
                text: '8',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('9'),
                text: '9',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('multiply'),
                text: '*',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                textSize: 24,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                key: Key('4'),
                text: '4',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('5'),
                text: '5',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('6'),
                text: '6',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('subtract'),
                text: '-',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                textSize: 38,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                key: Key('1'),
                text: '1',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('2'),
                text: '2',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('3'),
                text: '3',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('add'),
                text: '+',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                textSize: 30,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                key: Key('dot'),
                text: '.',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('0'),
                text: '0',
                callback: numClick,
                fillColor: Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('00'),
                text: '00',
                callback: numClick,
                textSize: 26,
                fillColor:Color.fromARGB(0, 242, 26, 26),
              ),
              CalcButton(
                key: Key('equal'),
                text: '=',
                fillColor: Color(0xFFFFFFFF),
                textColor: Color(0xFF65BDAC),
                callback: evaluate,
              ),
            ],
          )
        ],
      ),
        ),),
    );
  }
}