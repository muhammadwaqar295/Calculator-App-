import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'CalculatorButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {

  var userInput = '';
  var  answer = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded
                (
                  flex: 2,
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                    SizedBox(height: 18,),
                    Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)
                  ],
                ),
              )),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: 'AC',onPress: (){
                          userInput = '';
                          answer = '';
                          setState(() {

                          });
                        },),
                        MyButton(title: '+/-', onPress: () {
                          userInput +=  '+/-';
                          setState(() {

                          });
                
                        },),
                        MyButton(title: '%', onPress: () {
                          userInput +=  '%';
                          setState(() {

                          });
                        },),
                        MyButton(title: '/',color: Color(0xffffa00a), onPress: () {
                          userInput +=  '/';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '7',onPress: (){
                          userInput +=  '7';
                          setState(() {

                          });
                        },),
                        MyButton(title: '8', onPress: () {
                          userInput +=  '8';
                          setState(() {

                          });
                        },),
                        MyButton(title: '0', onPress: () {
                          userInput +=  '0';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'x',color: Color(0xffffa00a), onPress: () {
                          userInput +=  'x';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '4',onPress: (){
                          userInput +=  '4';
                          setState(() {

                          });
                        },),
                        MyButton(title: '5', onPress: () {
                          userInput +=  '5';
                          setState(() {

                          });
                        },),
                        MyButton(title: '6', onPress: () {
                          userInput +=  '6';
                          setState(() {

                          });
                        },),
                        MyButton(title: '-',color: Color(0xffffa00a), onPress: () {
                          userInput +=  '-';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '1',onPress: (){
                          userInput +=  '1';
                          setState(() {

                          });
                        },),
                        MyButton(title: '2', onPress: () {
                          userInput +=  '2';
                          setState(() {

                          });
                        },),
                        MyButton(title: '3', onPress: () {
                          userInput +=  '3';
                          setState(() {

                          });
                        },),
                        MyButton(title: '+',color: Color(0xffffa00a), onPress: () {
                          userInput +=  '+';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '0',onPress: (){
                          userInput +=  '0';
                          setState(() {

                          });
                        },),
                        MyButton(title: '.', onPress: () {
                          userInput +=  '.';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'DEL', onPress: () {
                         userInput = userInput.substring(0,userInput.length -1);
                         setState(() {

                         });
                        },),
                        MyButton(title: '=',color: Color(0xffffa00a), onPress: () {
                          equalPress();
                          setState(() {

                          });
                        },),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
// when click on = button and give to the answer section which i mentioned above
  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x','*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
