import 'package:bmicalculator/components/bottombutton.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/reusablecard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, this.bmiResult, this.resultText, this.interpretation});
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Your Result",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "$resultText",
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                  Text(
                    "$bmiResult",
                    style: const TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "$interpretation",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
