import 'package:bmi_calculator/resultbmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';
import 'reusable_card.dart';
import 'reusable_child.dart';
import 'constant.dart';
import 'round_icon_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum gendertas { male, female }

class _InputPageState extends State<InputPage> {
  dynamic myheight = 180;
  dynamic myweight = 70;
  dynamic age = 25;
  Color malecardcolor = kinactivecardcolour;
  Color femalecardcolor = kinactivecardcolour;
  @override
  Widget build(BuildContext context) {
    void changecardcolour(gendertas gender) {
      if (gender == gendertas.male) {
        if (malecardcolor == kinactivecardcolour) {
          malecardcolor = kactivecardcolour;
          femalecardcolor = kinactivecardcolour;
        } else {
          malecardcolor = kinactivecardcolour;
        }
      }
      if (gender == gendertas.female) {
        if (femalecardcolor == kinactivecardcolour) {
          femalecardcolor = kactivecardcolour;
          malecardcolor = kinactivecardcolour;
        } else {
          femalecardcolor = kinactivecardcolour;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changecardcolour(gendertas.male);
                        });
                      },
                      child: ReusableCard(
                        colour: malecardcolor,
                        cardChild: reusablechild(
                            icn: FontAwesomeIcons.male,
                            textgender: "MALE",
                            styletas: label_text_style),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changecardcolour(gendertas.female);
                        });
                      },
                      child: ReusableCard(
                        colour: femalecardcolor,
                        cardChild: reusablechild(
                          icn: FontAwesomeIcons.female,
                          textgender: "FEMALE",
                          styletas: label_text_style,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kinactivecardcolour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: label_text_style,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          myheight.toString(),
                          style: height_text_style,
                        ),
                        Text("cm")
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: myheight.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              myheight = value.round();
                            });
                          },
                          max: 500,
                          min: 0),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kinactivecardcolour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: label_text_style,
                          ),
                          Text(
                            myweight.toString(),
                            style: weight_text_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icn: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    myweight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icn: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    myweight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          colour: kinactivecardcolour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: label_text_style,
                              ),
                              Text(
                                age.toString(),
                                style: weight_text_style,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icn: FontAwesomeIcons.minus,
                                    onpress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icn: FontAwesomeIcons.plus,
                                    onpress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator_brain mycalc = Calculator_brain(myweight, myheight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultbmi(
                      bmi_results: mycalc.calculate_bmi(),
                      result_text: mycalc.getresult(),
                      comment: mycalc.comment(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                    child: const Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                color: kmybottomcontainerhex,
                height: kmybottomcontainerheight,
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
