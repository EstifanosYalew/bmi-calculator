import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.bmir, this.number, this.description);
  final String bmir;
  final String number;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                'YOUR RESULT',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  activecolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          number.toUpperCase(),
                          style: ktextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bmir,
                          style: kBMIStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          description,
                          style: kdescriptionstyle,
                        ),
                      )
                    ],
                  )),
            ),
            Center(
              child: Container(
                color: Colors.pink,
                width: double.infinity,
                height: 80.0,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'RE-CALCULATE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ));
  }
}
