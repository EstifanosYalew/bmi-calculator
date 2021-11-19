import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'text_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculatorBrain.dart';

const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);
int height = 180;
int weight = 70;
int age = 20;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecard = inactivecolor;
  Color femalecard = inactivecolor;

  void updatecolor(int a) {
    if (a == 1) {
      malecard = activecolor;
      femalecard = inactivecolor;
    } else {
      malecard = inactivecolor;
      femalecard = activecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(1);
                        });
                      },
                      child: ReusableCard(
                        malecard,
                        TextContent('MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(2);
                      });
                    },
                    child: ReusableCard(
                      femalecard,
                      TextContent('FEMALE'),
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  activecolor,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: firststyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kstyle,
                          ),
                          Text(
                            'cm',
                            style: firststyle,
                          )
                        ],
                      ),
                      Expanded(
                        child: Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newvalue) {
                              setState(() {
                                height = newvalue.round();
                              });
                            }),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    activecolor,
                    Column(
                      children: [
                        TextContent('WEIGHT'),
                        Text(
                          weight.toString(),
                          style: kstyle,
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RawMaterialButton(
                                      child: Icon(Icons.minimize),
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RawMaterialButton(
                                      child: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    activecolor,
                    Column(
                      children: [
                        TextContent('AGE'),
                        Text(
                          age.toString(),
                          style: kstyle,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: RawMaterialButton(
                                    child: Icon(Icons.minimize),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: RawMaterialButton(
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  CalculatorBrain calc = CalculatorBrain(height, weight);
                  return ResultsPage(
                      calc.calcBMI(), calc.result(), calc.getDescription());
                }));
              },
              child: Container(
                color: Colors.pink,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.w);
  final IconData icon;
  final int w;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
