import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resultpage.dart';
import 'Calculatingpage.dart';

const inactiveColor = Color(0xff26294C);
const activeColor = Color(0xff151A3C);
const lableStyle = TextStyle(fontSize: 18, color: Colors.white);
const numberStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = inactiveColor;
  Color femalecolor = inactiveColor;
  Gender selected = Gender.male;
  int height = 180;
  int weight = 62;
  int age = 25;

  void updatecolor({required Gender selected}) {
    if (selected == Gender.male) {
      malecolor = activeColor;
      femalecolor = inactiveColor;
    } else if (selected == Gender.female) {
      femalecolor = activeColor;
      malecolor = inactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(selected: Gender.male);
                    });
                  },
                  child: ReuseableCard(
                    colorOfTheCard: malecolor,
                    cardChild: CardIcon(
                        gender: 'Male', cardIcon: FontAwesomeIcons.mars),
                  )),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(selected: Gender.female);
                      });
                    },
                    child: ReuseableCard(
                      colorOfTheCard: femalecolor,
                      cardChild: CardIcon(
                          gender: 'Female', cardIcon: FontAwesomeIcons.venus),
                    )))
          ],
        ),
      ),
      Expanded(
          child: ReuseableCard(
        colorOfTheCard: inactiveColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: lableStyle,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: numberStyle,
                ),
                Text(
                  'cm',
                  style: lableStyle,
                )
              ],
            ),
            Slider(
              min: 100,
              max: 250,
              activeColor: Color(0xFFFF0066),
                inactiveColor: Color(0xff838599),
                value: height.toDouble(),
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                })
          ],
        ),
      )),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: ReuseableCard(
                colorOfTheCard: inactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: lableStyle,
                    ),
                    Text(
                      weight.toString(),
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            buttonicon: FontAwesomeIcons.plus),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            buttonicon: FontAwesomeIcons.minus)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ReuseableCard(
              colorOfTheCard: inactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Age',
                    style: lableStyle,
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          buttonicon: FontAwesomeIcons.plus),
                      SizedBox(
                        width: 10,
                      ),
                      RoundedButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          buttonicon: FontAwesomeIcons.minus)
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          BMICalculator cal= BMICalculator(height, weight);


          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultPage(bmi: cal.claculateBMI(),bmiresult: cal.resultText(),tips: cal.resultSuggestion(),);
          }));
        },
        child: Container(
          color: Color(0xFFFF0066),
          height: 80,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: Center(
              child: Text(
            "Calculate My BMI",
            style: TextStyle(
                letterSpacing: 2.5, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      )
    ]);
  }
}

class ReuseableCard extends StatelessWidget {
  final Color colorOfTheCard;
  final Widget? cardChild;
  ReuseableCard({required this.colorOfTheCard, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorOfTheCard, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class CardIcon extends StatelessWidget {
  final String gender;
  final IconData cardIcon;

  CardIcon({required this.gender, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(gender, style: lableStyle),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({Key? key, required this.onPressed, required this.buttonicon})
      : super(key: key);
  final void Function()? onPressed;
  final IconData buttonicon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints().tighten(width: 56, height: 56),
      elevation: 10,
      disabledElevation: 5,
      child: Icon(
        buttonicon,
      ),
      fillColor: Color(0xff1C1F32),
    );
  }
}
