import 'package:bmicalculator/components/bottombutton.dart';
import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/iconcontent.dart';
import 'package:bmicalculator/screens/resultpage.dart';
import 'package:bmicalculator/components/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/roundbutton.dart';

enum Gender { male, female }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: (selectedGender == Gender.male)
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: (selectedGender == Gender.female)
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color(0XFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numbertextstyle,
                      ),
                      const Text(
                        "cm",
                        style: labeltextstyle,
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                            trackHeight: 3,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 8,
                            ),
                            overlayColor: bottomContainerColor),
                        child: Slider(
                          thumbColor: bottomContainerColor,
                          activeColor: Colors.white,
                          inactiveColor: const Color(0xFF8D8E98),
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                          max: 220,
                          min: 120,
                        ),
                      )
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
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labeltextstyle,
                        ),
                        Text(
                          "$weight",
                          style: numbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
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
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: labeltextstyle,
                        ),
                        Text(
                          "$age",
                          style: numbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
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
            ),
          ),
          BottomButton(
            onPressed: () {
              CalculatorBrain clc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: clc.calculateBMI(),
                      resultText: clc.getResult(),
                      interpretation: clc.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
