import 'package:bmicalculator/screens/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          color: Color(0xFF0A0E21),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}
