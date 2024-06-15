import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
        color: bottomContainerColor,
        child: const Center(
          child: Text(
            "CALCULATE",
            style: largetextstyle,
          ),
        ),
      ),
    );
  }
}
