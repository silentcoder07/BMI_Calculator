import 'dart:ui';
import 'package:flutter/material.dart';
import 'inputpage.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key,required this.bmiresult,required this.bmi,required this.tips}) : super(key: key);
  final String bmiresult;
  final String bmi;
  final String tips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              flex: 6,
              child: ReuseableCard(
                colorOfTheCard: inactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiresult.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      bmi,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      tips,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF0066),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
              ),
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                  child: Text(
                "RE-CALCULATE",
                style: TextStyle(
                    letterSpacing: 2.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )

        ],
      ),
    );
  }
}
