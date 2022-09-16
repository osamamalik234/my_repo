import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/my_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        result.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          text1: 'AC',
                          press: () {
                            userInput = '';
                            result = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '+/-',
                          press: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '%',
                          press: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '/',
                          press: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          text1: '7',
                          press: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '8',
                          press: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '0',
                          press: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: 'x',
                          press: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          text1: '4',
                          press: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '5',
                          press: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '6',
                          press: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '-',
                          press: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          text1: '1',
                          press: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '2',
                          press: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '3',
                          press: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '+',
                          press: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          text1: '0',
                          press: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '.',
                          press: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: 'DEL',
                          press: () {
                            userInput =
                                userInput.substring(1, userInput.length);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          text1: '=',
                          press: () {
                            equal();
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equal() {

    final lastUserInput = userInput.replaceAll('x', '*');
    Parser parse = Parser();
    Expression exp = parse.parse(lastUserInput);
    ContextModel contextModel = ContextModel();
    double eval =  exp.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
